function [Mgc mgc P ix]=p_AllMarginalContributions(clv)
% P_ALLMARGINALCONTRIBUTIONS computes all marginal worth vectors 
% of a TU-game v. Using Matlab's PCT.
%
% Usage: [Mgc mgc P ix]=p_AllMarginalContributions(clv)
%
% Define variables:
%  output:
%  Mgc      -- The matrix of marginal contributions.
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
%   10/30/2012        0.3              hme
%   08/31/2020        1.9              hme
%                

v=clv.tuvalues;
N=clv.tusize;
n=clv.tuplayers;
pl=1:n;
pm=perms(pl);
sz=size(pm);
Mgc=zeros(sz);
A=triu(ones(n));

spm=bitset(0,pm);

P=spm*A;

if n<11
  SP=circshift(P,[0 1]);
  shv=v(SP);
  shv(:,1)=0;
  mgc=v(P)-shv;
 else
  mgc=zeros(sz);
  vm=v(P);
  dv=diff(vm,1,2);
  mgc(:,[2:n])=dv;
end

[spmix ix]=sort(pm,2);

parfor k=1:sz(1)
  Mgc(k,:)=mgc(k,ix(k,:));
end

