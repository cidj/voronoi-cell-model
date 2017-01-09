function [angles,edges,cvx,len ] = anglesedges( p )
%ANGLESEDGES Summary of this function goes here
%   Detailed explanation goes here

%pp=[p;p(1,:)];
%if(ispolycw(pp(:,1),pp(:,2)))
%    p=fliplr(p')';
%end

if(ployorder(p))
    p=fliplr(p')';
end

len=length(p);
edges=sqrt(sum(diff([p;p(1,:)]).^2,2));
angles=zeros(len,1);

for i=1:len,
    j=peris(i-1,len);
    k=peris(i+1,len);  
    anglat=atan2d(p(k,2)-p(i,2),p(k,1)-p(i,1));
    angfor=atan2d(p(j,2)-p(i,2),p(j,1)-p(i,1));
    angles(i)=angfor-anglat;
end
angles=mod(angles,360);
cvx=0;
for i=1:len,
    if(angles(i)>180),
        cvx=cvx+1;
    end
end

% figure;
% pp=[p;p(1,:)];
% plot(pp(:,1),pp(:,2));
% hold on;
% for i=1:len,
%     if (angles(i)<180)
%         plot(p(i,1),p(i,2),'*');
%     elseif (angles(i)>180)
%         plot(p(i,1),p(i,2),'o');
%     end
% %     text(p(i,1),p(i,2),['   ',num2str(i),'   ',num2str(anglat(i)),'   ',num2str(angfor(i)),'   ',num2str(angles(i))]);
%     text(p(i,1),p(i,2),['   ',num2str(i),'   ',num2str(angles(i))]);
% end

end

