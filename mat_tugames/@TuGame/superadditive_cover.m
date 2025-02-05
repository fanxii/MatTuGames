function v_st=superadditive_cover(clv)
% SUPERADDITIVE_COVER computes from game v its superadditive cover.
% It requires Partition of an Integer from
% 
% SOURCE: http://www.mathworks.com/matlabcentral/fileexchange/12009-partitions-of-an-integer
%
% It takes some time to finish for n=7. Needs a lot of memory.
%
% Usage: v_st=clv.superadditive_cover
% Define variables:
%
%  output:
%  v_st     -- The superadditive cover of game v.
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
%   02/24/2016        0.8             hme


v=clv.tuvalues;
N=clv.tusize;
n=clv.tuplayers;
v_st=zeros(1,N);
it=0:-1:1-n;
jj=1:n;
for S=1:N               % We have to rethink about the partition of integers.
   pt=intpartitions(S); % the partition consumes most of the computing time.
   sm=numel(pt);
   vp=zeros(1,sm);
   idx=[];
   for k=1:sm
       ui=unique(pt{k});
       sQ=sum(ui);
       if sQ==S;
          ps=bitget(S,jj)==1;
          lp=ps*ones(n,1);
          sS=double(ui);
          ci=rem(floor(sS(:)*pow2(it)),2)==1;
          sci=size(ci,1);
          ad=ones(1,sci)*ci;
          if all(ad==ps)
             vp(k)=sum(v(ui));
          else
             idx=[idx,k]; 
          end
       else
          idx=[idx,k]; 
       end
   end
   vp(idx)=[];
   v_st(S)=max(vp);
end
    
