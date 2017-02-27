function [theva0,thenvb,linklist] = insertvertexsimu( n1,c1,newvertex,theva0,thenvb,linklist)
%INSERTVERTEX Summary of this function goes here
%   Detailed explanation goes here

theva0=[theva0;newvertex];
newn=size(theva0,1);

pos=find(thenvb{c1}==n1);
lpos=length(thenvb{c1});
posf=peris(pos-1,lpos);
posr=peris(pos+1,lpos);
vpos=thenvb{c1}(pos);
vposf=thenvb{c1}(posf);
vposr=thenvb{c1}(posr);
cf=setdiff(findthecells([vpos,vposf],thenvb),c1);
cr=setdiff(findthecells([vpos,vposr],thenvb),c1);
thenvb{c1}(pos)=newn;
thenvb{cf}=joinsvertex([n1,newn,vposf],thenvb{cf});
thenvb{cr}=joinsvertex([n1,newn,vposr],thenvb{cr});


linklist{n1}(linklist{n1}==vposf)=[];
linklist{n1}(linklist{n1}==vposr)=[];
linklist{n1}=[linklist{n1},newn];

linklist{vposf}(linklist{vposf}==n1)=newn;
linklist{vposr}(linklist{vposr}==n1)=newn;

linklist=[linklist;[n1,vposf,vposr]];

end

