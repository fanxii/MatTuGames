function [jhidx,ssw,sw]=p_Johnston(clv)
% P_JOHNSTON computes the Johnston power index from the set of winning coalitions.
%
% Usage: dpidx=Johnston(sv)
% Define variables:
%  output:
%  jhidx    -- The Johnston power index.
%  ssw      -- Sets that contains a swing player. 
%  sw       -- Vector of number of swings per player. 
%
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
%   12/03/2020        1.9             hme
%

sv=clv.tuvalues;
N=clv.tusize;
n=clv.tuplayers;
gt=clv.tutype;
if strcmp(gt,'sv')
else
   error('Wrong game type!. Game must be a simple game!')
end
S=1:N;
sv=logical(sv);
jhidx=zeros(1,n);
jc=zeros(1,n);
sw=zeros(1,n);
ssw=cell(1,n);

parfor k=1:n
    plk=bitget(S,k)==1;
    nplk=plk==0;
    Clk=S(plk);
    Clnk=S(nplk);
    w_clk=sv(Clk);
    nw_clk=[0,sv(Clnk)]; % including empty set.
    ssw{k}=Clk(logical(w_clk-nw_clk)); % sets that contain a swing player.
    sw(k)=nnz(ssw{k});
end
cm=cell2mat(ssw);
gv=unique(cm);
%% Counting the number of critical players per swing coalition.
parfor k=1:n
    mat(k,:)=ismember(gv,ssw{k});
end	
cr=sum(mat,1);
m=1/length(gv);
parfor k=1:n
   jhidx(k)=m*sum(1./cr(mat(k,:)));
end	



