dotnm=length(dZZ);
% dZZ_ext=ext9(lengtha,lengthb,dZZ);
% dotnm_ext=length(dZZ_ext);
[va0,vb0] = voronoiDiagram(delaunayTriangulation(dZZ));
p=10;
% [va0,vb0] = voronoin(dZZ);
% [va,vb] = voronoiDiagram(delaunayTriangulation(dZZ_ext));
dZZZ=dZZ;
    dZZZ(p,:)=move(dZZZ(p,1),dZZZ(p,2),pi/4,2);
    dZZZ(p,:)=fallsquare( dZZZ(p,:),0,lengtha,0,lengthb );
    [va1,vb1] = voronoiDiagram(delaunayTriangulation(dZZ));
% [va1,vb1] = voronoin(dZZZ);

figure;
subplot(1,2,1);
hold on
voronoi(dZZ(:,1),dZZ(:,2));
plot(dZZ(p,1),dZZ(p,2),'O','MarkerEdgeColor','g','MarkerFaceColor','g')
subplot(1,2,2);
hold on
voronoi(dZZZ(:,1),dZZZ(:,2));
plot(dZZZ(p,1),dZZZ(p,2),'O','MarkerEdgeColor','m','MarkerFaceColor','m')




% cw0=zeros(dotnm,1);
% for i=1:dotnm,
%     xy=va0(vb0{i},:);
%     xy=[xy;xy(1,:)];
%     cw0(i)=ispolycw(xy(:,1),xy(:,2));
% end
% 
% cw=zeros(dotnm,1);
% for i=1:dotnm,
%     xy=va(vb0{i},:);
%     xy=[xy;xy(1,:)];
%     cw(i)=ispolycw(xy(:,1),xy(:,2));
% end