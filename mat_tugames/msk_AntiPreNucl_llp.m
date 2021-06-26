function [x1, alp]=msk_AnitPreNucl_llp(v,tol)
% MSK_ANTIPRENUCL computes the anti pre-nucleolus of game v using mosekmex.
% 
% MSK-SOLVER: http://www.mosek.com/
%
% Usage: [x, alp]=msk_AntiPreNucl_llp(v,tol)
% Define variables:
%  output:
%  x1        -- The anti pre-nucleolus of game v.
%  alp       -- The maxmin excess value.
%
%  input:
%  v        -- A Tu-Game v of length 2^n-1. 
%  tol      -- Tolerance value. Its default value is set to 10^8*eps.


%  Author:        Holger I. Meinhardt (hme)
%  E-Mail:        Holger.Meinhardt@wiwi.uni-karlsruhe.de
%  Institution:   University of Karlsruhe (KIT)  
%
%  Record of revisions:
%   Date              Version         Programmer
%   ====================================================
%   08/05/2016        0.9             hme
%   03/29/2021        1.9             hme
%                



if nargin<2
 tol= 10^8*eps; % Change this value if the solution is not correct.
end
%tol=-tol;

N=length(v);
[~, n]=log2(N);
if N==3
  x1=StandardSolution(v);
  return
end
S=1:N;

% upper bound increases elapsed computation time.
%ra = reasonable_outcome(v);
%ub=[ra,inf]';
sm=smallest_amount(v)';
k=1:n;
vi=v(bitset(0,k));
%ub=[vi,Inf]';
ub=[inf(n,1);Inf];
lb=[sm;-Inf];

for k=1:n, A1(:,k) = bitget(S,k);end
A1(N+1,:)=-A1(end,:);
A1(:,end+1)=1;
A1(N:N+1,end)=0;
%A1(N+1,end)=0;
B1=[v';-v(N)];
prob.buc=B1;
c=[zeros(n,1);1];
prob.c=c;
prob.blc=-inf(N+1,1);
prob.blx=lb;
prob.bux=ub;
% Changing parameter values to increase precision.
[rcode,res] = mosekopt('param echo(0)');
param=res.param;
%param.MSK_IPAR_INTPNT_BASIS   = sc.MSK_OFF;
param.MSK_DPAR_INTPNT_TOL_REL_GAP = 1.0000e-12; % Adjust this value if the solution is not correct.
% param.MSK_IPAR_OPTIMIZER = 5;  % Using dual simplex. % MSK7
param.MSK_IPAR_OPTIMIZER ='MSK_OPTIMIZER_DUAL_SIMPLEX'; % MSK 8
param.MSK_DPAR_BASIS_TOL_X = 1.0e-9;
param.MSK_DPAR_BASIS_TOL_S = 1.0e-9;
%param=[];
bA=find(A1(:,end)==0);
while 1
  A2=sparse(A1);
  prob.a=A2;
  [rcode,res] = mosekopt('maximize echo(0)',prob,param);
  sol=res.sol;
  x=sol.bas.xx';
  x1=x;
  x1(end)=[];
  alp=sol.bas.pobjval;
  bS1=(find(sol.bas.y>tol));
  bS2=setdiff(bS1,bA);
  if isempty(bS2)==1
     break;
  end
  it=0:-1:1-n;
  bA=[bA;bS2];
  mS2=rem(floor(bA(:)*pow2(it)),2);
  rk=rank(mS2);
  B1(bS2)=B1(bS2)-alp;
  if rk==n 
     x=(-mS2\B1(bA))';
     break;
  end
  A1(bS2,end)=0;
  prob.buc=sparse(B1);
end
