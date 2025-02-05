function v=complementary_game(P,Q,n)
% COMPLEMENTARY_GAME(P,Q,n) generates a producer and buyer game.
% 
% Usage: v=complementary_game(P,Q,n)
%
% Define variables:
% output:
%  v        -- A Tu-Game v of length 2^n-1. 
%
% input: 
%  P        -- An integer to specify the set of producers. 
%  Q        -- An integer to specify the set of buyers s.t. P and Q
%              partition N.
%  n        -- An integer to specify the number of persons involved in
%              the game.
%

%  Author:        Holger I. Meinhardt (hme)
%  E-Mail:        Holger.Meinhardt@wiwi.uni-karlsruhe.de
%  Institution:   University of Karlsruhe (KIT)  
%
%  Record of revisions:
%   Date              Version         Programmer
%   ====================================================
%   06/19/2013        0.4             hme
%                
N=2^n-1;
S=1:N;
if isempty(bitand(P,Q))==1
   error('Both sets must be disjoint!')
else
   if bitor(P,Q)~=N
     error('Both sets must partition the grand coaliton!')
   end
end 
csz=zeros(1,N);
v=zeros(1,N);
sp=bitand(S,P);
sq=bitand(S,Q);
for ii=1:n
       msp(:,ii)=bitget(sp,ii);
       msq(:,ii)=bitget(sq,ii);
end
psz=msp*ones(n,1);
qsz=(1/2)*msq*ones(n,1);
v=(min(psz,qsz))';



