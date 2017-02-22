function [ ol,oa ] = genorder( shaperesults)
%GENORDER Summary of this function goes here
%   Detailed explanation goes here

weight=[150,50,50,150,0,150,0];
% weight=[1,1,1,1,1,1,1];

ocar4=difffrom(shaperesults(:,1));
oar4=difffrom(shaperesults(:,2));
oisq4=difffrom(shaperesults(:,3)).^0.5;
oaa4=difffrom(shaperesults(:,4)).^0.5;
opp4=difffrom(shaperesults(:,5));
osaa4=shaperesults(:,6);
ospp4=shaperesults(:,7).^2;

ocar4=ocar4/nanmean(ocar4)*weight(1);
oar4=oar4/nanmean(oar4)*weight(2);
oisq4=oisq4/nanmean(oisq4)*weight(3);
oaa4=oaa4/nanmean(oaa4)*weight(4);
opp4=opp4/nanmean(opp4)*weight(5);
osaa4=osaa4/nanmean(osaa4)*weight(6);
ospp4=ospp4/nanmean(ospp4)*weight(7);


% list=[ocar4,oar4,oisq4,oaa4,opp4,osaa4,ospp4];

summ=(ocar4+oar4+oisq4+oaa4+opp4+osaa4+ospp4)/sum(weight);

[oa,ol]=sort(summ);
% for i=1:5,
%     disp(fourcells(ol(i),:));
% end

end

