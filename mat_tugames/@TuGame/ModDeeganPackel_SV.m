function dpidx=ModDeeganPackel_SV(clv)
% ModDeeganPackel_SV computes the Deegan-Packel index from a simple game to construct the set of minimal winning coalitions.
%
% Usage: dpidx=clv.ModDeeganPackel_SV()
% Define variables:
%  output:
%  dpidx    -- The modified Deegan-Packel index.
%
%  input:
%  clv      -- TuGame class object.
%

%  Author:        Holger I. Meinhardt (hme)
%  E-Mail:        Holger.Meinhardt@wiwi.uni-karlsruhe.de
%  Institution:   University of Karlsruhe (KIT)  
%
%  Record of revisions:
%   Date              Version         Programmer
%   ====================================================
%   12/01/2020        1.9             hme
%

sv=clv.tuvalues;
N=clv.tusize;
n=clv.tuplayers;
gt=clv.tutype;
if strcmp(gt,'sv')
else
   error('Wrong game type!. Game must be a simple game!')
end

sWCk=zeros(1,n);
[~,WC]=clv.getMinimalWinning();
m=length(WC);
dpidx=zeros(1,n);
for k=1:n;
  mWCk=WC(bitget(WC,k)==1);
  sk=length(mWCk);
  A=zeros(sk,1);
  for jj=1:n, 
      A(:,jj) = bitget(mWCk,jj);
  end
  ssk=sum(1./(A*ones(n,1)));
  dpidx(k)=ssk/m; 
end

