function [ fourcenters ] = fourcentersfun( fourcells,CCtp,AAtp,lengtha,lengthb )
%FOURCENTERSFUN Summary of this function goes here
%   Detailed explanation goes here
llen=length(fourcells);
fourcenters=zeros(llen,2);
for i=1:llen,
    c1=fourcells(i,1);
    c2=fourcells(i,2);
    c3=fourcells(i,3);
    c4=fourcells(i,4);
%     if(isnan(c1)||isnan(c2)||isnan(c3)|isnan(c4))
%      fourcenters(i,1)=   
    x1=0;
    x2=perodist(CCtp(c2,1)-CCtp(c1,1),lengtha);
    x3=perodist(CCtp(c3,1)-CCtp(c1,1),lengtha);
    x4=perodist(CCtp(c4,1)-CCtp(c1,1),lengtha);
    y1=0;
    y2=perodist(CCtp(c2,2)-CCtp(c1,2),lengthb);
    y3=perodist(CCtp(c3,2)-CCtp(c1,2),lengthb);
    y4=perodist(CCtp(c4,2)-CCtp(c1,2),lengthb);
    
    upperx=AAtp(c1)*x1+AAtp(c2)*x2+AAtp(c3)*x3+AAtp(c4)*x4;
    uppery=AAtp(c1)*y1+AAtp(c2)*y2+AAtp(c3)*y3+AAtp(c4)*y4;
    lower=AAtp(c1)+AAtp(c2)+AAtp(c3)+AAtp(c4);
    fourcenters(i,1)=fall(CCtp(c1,1)+upperx/lower,0,lengtha);
    fourcenters(i,2)=fall(CCtp(c1,2)+uppery/lower,0,lengthb);
end

end

