x = gallery('uniformdata',[1 10],0);
y = gallery('uniformdata',[1 10],1);
[vvx,vvy] = voronoi(x,y);
%plot(x,y,'r+',vvx,vvy,'b-')
axis equal