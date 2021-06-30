function ADP=A_NullPlayer_propertyQ(clv,x,tol)
% A_NullPlayer_propertyQ checks if the solution x satisfies the A-Null player property.
%
% Source: Nowak AS, Radzik T (1994) A solidarity value for n-person transferable utility games. 
%         International Journal of Game Theory 23: 43-48.
%
%
% Usage: ADP=clv.A_NullPlayer_propertyQ(x,tol)
% Define structures variables:
%  output:
%  Q        -- Returns 1 (true) whenever the solution satisfies the A-Null player property, 
%              otherwise 0 (false). 
%  ply      -- Returns 1 (true) whenever the player k is an A-Null player, 
%              otherwise 0 (false).
%  x        -- Returns input payoff vector. 
%
%  input:
%  clv      -- TuGame class object.
%  x        -- payoff vector of size(1,n). Must be efficient.
%  tol      -- Tolerance value. Its default value is set to 10^6*eps.
%


%  Author:        Holger I. Meinhardt (hme)
%  E-Mail:        Holger.Meinhardt@wiwi.uni-karlsruhe.de
%  Institution:   University of Karlsruhe (KIT)  
%
%  Record of revisions:
%   Date              Version         Programmer
%   ====================================================
%   12/25/2020        1.9             hme
%                

if nargin<3
 tol=10^7*eps;
end

N=clv.tusize;
n=clv.tuplayers;
v=clv.tuvalues;
effQ=abs(sum(x)-v(N))<tol;

if effQ==0
   ADP.Q=false;	
   ADP.ply=[];
   ADP.x=x;
   return;
end

S=1:N;
Si=zeros(n,1);
k=1:n;
cli=2.^(k-1);
for ss=1:N
   a=k(bitget(ss,k)==1);
   lss=length(a);
   nsi=bitset(ss,k,0);
   nsi=nsi(nsi~=ss);
   if nsi==0
     dvS(ss)=0;
   else	   
     dvS(ss)=sum(v(nsi))/lss;
   end
%   dvS(ss)=(dvi(ss)-v(ss))/lss;
end

ApQ=false(1,n);
adpQ=false(1,n);
for kk=1:n
    cl=S(bitget(S,kk)==1);
    adpQ(kk)=all(abs(dvS(cl))<tol) && v(cli(kk))==0;
    if adpQ(kk)==1
       ApQ(kk)=x(kk)==0;
    elseif x(kk)~=0  %% contrapositive
       ApQ(kk)=adpQ(kk)==0;	    
    end	    
end
ADP.Q=all(ApQ);
ADP.ply=adpQ;
ADP.x=x;