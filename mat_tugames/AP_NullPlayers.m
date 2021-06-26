function [apnlp,apdpQ]=AP_NullPlayers(v,tol)
% AP_NullPlayers returns the players who are AP-Null players.
%
% Usage: apdpQ=AP_NullPlayers(v,tol)
% Define variables:
%  output:
%  apnlp    -- Returns list of AP-Null players. Empty set if there is no AP-null player.
%  apnlpQ   -- Returns 1 (true) whenever the player k is an AP-Null player, 
%              otherwise 0 (false). 
%
%  input:
%  v        -- A TU-game of length 2^n-1.
%  tol      -- Tolerance value. Its default value is set to 10^6*eps.
%


%  Author:        Holger I. Meinhardt (hme)
%  E-Mail:        Holger.Meinhardt@wiwi.uni-karlsruhe.de
%  Institution:   University of Karlsruhe (KIT)  
%
%  Record of revisions:
%   Date              Version         Programmer
%   ====================================================
%   02/25/2020        1.9             hme
%                

if nargin<2
 tol=10^6*eps;
end

N=length(v);
[~, n]=log2(N);
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
     dvi(ss)=v(ss);
   else	   
     dvi(ss)=lss*v(ss)-sum(v(nsi));
   end
   dvS(ss)=(dvi(ss)-v(ss))/lss;
end

apdpQ=false(1,n);
for kk=1:n
    cl=S(bitget(S,kk)==1);
    apdpQ(kk)=all(abs(dvS(cl))<tol) && v(cli(kk))==0;
end	
apnlp=k(apdpQ);


