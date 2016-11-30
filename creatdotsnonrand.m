function [ XY ] = creatdotsnonrand( cellv,cellh,celllattx,celllatty )
%CREATDOTS Summary of this function goes here
%   Detailed explanation goes here

rng('default');
xx=zeros(cellv,cellh);
yy=zeros(cellv,cellh);
XY=zeros(cellv*cellh,2);

for j=1:cellh,
    for i=1:cellv,
        xx(i,j)=(j-1+0.5)*celllattx;
        yy(i,j)=(i-1+0.5)*celllatty;
%         plot(xx(i,j),yy(i,j),'O','MarkerEdgeColor','y','MarkerFaceColor','y');
%         text(xx(i,j),yy(i,j),[num2str(i),',',num2str(j)],'FontSize',8);
%         text(xx(i,j),yy(i,j),num2str(double2single(i,j,cellv)),'FontSize',8);
%         hold on;
    end
end
XY(:,1)=reshape(xx,[],1);
XY(:,2)=reshape(yy,[],1);

end

