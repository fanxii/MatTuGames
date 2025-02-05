function SOL=tug_Bankruptcy(E,d)
% TUG verifies game solution/property with the Mathematica Package TuGames.
%
% Usage: SOL=tug_Bankruptcy(E,d)
% Define variables:
%  output:
%  SOL        -- Returns a modest bankruptcy game.
%                Field variable gives result in Matlab and Mathematica format.
%  input:
%  E          -- Estate, it is an integer value.
%  d          -- Claimants vector of length (1xn).
%

%  Author:        Holger I. Meinhardt (hme)
%  E-Mail:        Holger.Meinhardt@wiwi.uni-karlsruhe.de
%  Institution:   University of Karlsruhe (KIT)
%
%  Record of revisions:
%   Date              Version         Programmer
%   ====================================================
%   03/06/2011        0.1 beta        hme
%   07/02/2021        1.9             hme
%

% Here we assume that the user has represented the game correctly.
if nargin<1
    error('The Estate and the claims vector must be provided!');
elseif nargin<2
    error('The claims vector must be provided!');
else
  if isvector(d)==0
     error('The claims must be a vector of length greater or equal to 2!');
  else
  end
  if length(E)~=1
     error('The Estate must be an integer!');
  else
  end
end

math('quit')
pause(1)
math('$Version')
try 
    math('{Needs["TUG`"] }'); 
catch 
    math('{Needs["coop`CooperativeGames`"],Needs["VertexEnum`"],Needs["TuGames`"],Needs["TuGamesAux`"] }'); 
end
disp('Passing Bankruptcy Situation to Mathematica ...')
math('matlab2math','est',E);
math('est1=Flatten[est,1][[1]]');
math('matlab2math','d1',d);
math('clv=Flatten[d1,1]');
disp('Determing Bankruptcy Game ...')
mabv=math('mbv=ModestBankruptcy[est1,clv]');
mbg=math('math2matlab','mbv');
mbg(:,1)=[];
bv=gameToMatlab(mbg);
SOL=struct('BankruptcyGame',bv,'MBankruptcyGame',mabv,'WGame',mbg);
math('quit')
