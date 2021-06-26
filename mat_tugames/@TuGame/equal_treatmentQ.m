function ETP=equal_treatmentQ(clv,x,tol)
% EQUAL_TREATMENTQ checks if the vector x satisfies the equal
% treatment property (ETP).
%
% Usage: ETP=clv.equal_treatmentQ(x,tol)
%
% Define variables:
%  output:
%  eqtQ       -- Returns true (1) if the solution x satisfies ETP,
%                otherwise false (0).   
%  eqt        -- Returns an array of ones (true )and/or zeros
%                (false) for each investigated pair of substitutes.
%  sbs_v       -- A matrix of substitutes. 
%                Shows in each row the pair that are substitutes.
%
%  input:
%  clv      -- TuGame class object.
%  x        -- payoff vector of size(1,n) (optional)
%  tol      -- Tolerance value. Its default value is set to 10^6*eps.
%

%  Author:        Holger I. Meinhardt (hme)
%  E-Mail:        Holger.Meinhardt@wiwi.uni-karlsruhe.de
%  Institution:   University of Karlsruhe (KIT)  
%
%  Record of revisions:
%   Date              Version         Programmer
%   ====================================================
%   02/06/2015        0.6             hme
%   02/22/2017        0.9             hme
%   12/27/2020        1.9             hme
% 


if nargin < 3
    tol=10^6*eps;
end    

Dx=diag(true(1,n));
Dx0=Dx;
for kk=1:n-1
    for jj=2:n
        Dx(kk,jj)=abs(x(kk)-x(jj))<tol;
    end
end
mteq=all(all(Dx==Dx0));
sbs_v=clv.substitutes();
if isempty(sbs_v)==0
   ls=size(sbs_v,1);
   eqt=false(1,ls);
   for k=1:ls
       y=x(sbs_v(k,:));
       eqt(k)=abs(y(1)-y(2))<tol;
   end    
   eqtQ=all(eqt);
elseif mteq==1 %% contrapositive
   eqtQ=isempty(sbs);
   eqt=[];
else
   eqtQ=false;
   eqt=[];
end    

ETP=struct('eqtQ',eqtQ,'eqt',eqt,'sbs',sbs);
