function [ zzz ] = genindexorder(shaperesults  )
%GENINDEXORDER Summary of this function goes here
%   Detailed explanation goes here
weight=[70,30,0,0,0,0,0];
% weight=[0,0,0,0,0,100,0];

ocar4=difffrom(shaperesults(:,1));
oar4=difffrom(shaperesults(:,2));
oisq4=(1-shaperesults(:,3)).^0.5;
oaa4=difffrom(shaperesults(:,4)).^0.5;
opp4=difffrom(shaperesults(:,5));
osaa4=shaperesults(:,6).^0.5;
ospp4=shaperesults(:,7);

[~,lcar4]=sort(ocar4);
[~,lar4]=sort(oar4);
[~,lisq4]=sort(oisq4);
[~,laa4]=sort(oaa4);
[~,lpp4]=sort(opp4);
[~,lsaa4]=sort(osaa4);
[~,lspp4]=sort(ospp4);

l1=natnum2index(lcar4);
l2=natnum2index(lar4);
l3=natnum2index(lisq4);
l4=natnum2index(laa4);
l5=natnum2index(lpp4);
l6=natnum2index(lsaa4);
l7=natnum2index(lspp4);

len=length(l1);
aaa=l1+l2+l3+l4+l5;
[~,zzz]=sort(aaa);
    
% for i=1:5,
%     disp(fourcells(ol(i),:));
% end

end

