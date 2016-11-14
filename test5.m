cellh=4;
unitnm=3;
cellv=unitnm*cellh;
celllattx=5;
celllatty=5;
dotnm=cellv*cellh;
cellnm=cellh*cellh;
lengtha=celllattx*cellh;
lengthb=celllatty*cellv;


xx=zeros(cellv,cellh);
yy=zeros(cellv,cellh);
randnumx=rand(cellv,cellh);
randnumy=rand(cellv,cellh);
XY=zeros(cellv*cellh,2);

for j=1:cellh,
    for i=1:cellv,
        xx(i,j)=(j-1+randnumx(i,j))*celllattx;
        yy(i,j)=(i-1+randnumy(i,j))*celllatty;
        %plot(xx(i,j),yy(i,j),'O','MarkerEdgeColor','y','MarkerFaceColor','y');
        %text(xx(i,j),yy(i,j),[num2str(i),',',num2str(j)],'FontSize',8);
        %text(xx(i,j),yy(i,j),num2str(double2single(i,j,cellv)),'FontSize',8);
        %hold on;
    end
end
XY(:,1)=reshape(xx,[],1);
XY(:,2)=reshape(yy,[],1);

hln=cellh;
vln=cellv;
XY_bd=abd( XY, celllattx,celllatty,lengtha,lengthb,hln,vln );

% xl=-celllattx/2;
% xr=lengtha+celllattx/2;
% yu=lengthb+celllatty/2;
% yd=-celllatty/2;
% hln=4;
% vln=12;
% BB=bd( xl,xr,yu,yd,hln,vln);

% hl=(xr-xl)/hln;
% vl=(yu-yd)/vln;
% bdn=2*(hln+vln);
% BB=zeros(bdn,2);
% 
% for i=1:bdn,
%     if(i<=vln)
%     BB(i,1)=xl;
%     BB(i,2)=yd+(i-1)*vl;
%     elseif(i<=vln+hln)
%         BB(i,1)=xl+(i-vln-1)*hl;
%         BB(i,2)=yu;
%     elseif(i<=2*vln+hln)
%         BB(i,1)=xr;
%         BB(i,2)=yu-(i-vln-hln-1)*vl;
%     else
%        BB(i,1)=xr-(i-2*vln-hln-1)*hl;
%        BB(i,2)=yd;
%     end
% end
% %plot(BB(:,1),BB(:,2),'o');

% XY_bd=[XY;BB];

[vx,vy]=voronoi(XY_bd(:,1),XY_bd(:,2));
plot(XY_bd(:,1),XY_bd(:,2),'r+',vx,vy,'b-');
axis equal