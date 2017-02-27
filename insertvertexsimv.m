function [theva0,thenvb] = insertvertexsimv( n1,c1,thed,theva0,thenvb,lengtha,lengthb)
%INSERTVERTEX Summary of this function goes here
%   Detailed explanation goes here

% n1=32;

% len=size(theva0,1);
temp=zeros(size(theva0));
for i=1:size(theva0,1),
    if(i~=n1)
    temp(i,:)=movetogether(theva0(n1,:),theva0(i,:),lengtha,lengthb);
    end
end

% neighbors=findthecells(n1,thenvb);
% c1=neighbors(floor(rand(1)*length(neighbors))+1);
c1coo=thenvb{c1};
c1cop=temp(c1coo,:);


while(1),
    angle=rand(1)*2*pi;
%     pace=rand(1)*thed;
    pace=thed;
    newvertex=move(theva0(n1,1),theva0(n1,2),angle,pace);
    
    signin=inpolygon(newvertex(1),newvertex(2),c1cop(:,1),c1cop(:,2));
    if(signin)
        break;
    end
end

newvertex=fallsquare(newvertex,0,lengtha,0,lengthb );
theva0=[theva0;newvertex];
newn=size(theva0,1);

pos=find(thenvb{c1}==n1);
lpos=length(thenvb{c1});
posf=peris(pos-1,lpos);
posr=peris(pos+1,lpos);
cf=setdiff(findthecells([pos,posf],thenvb),c1);
cr=setdiff(findthecells([pos,posr],thenvb),c1);
thenvb{c1}(pos)=newn;
thenvb{cf}=joinsvertex([n1,newn,posf],thenvb{cf});
thenvb{cr}=joinsvertex([n1,newn,posr],thenvb{cr});

    
% end

