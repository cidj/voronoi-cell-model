x=[0.5 0
    0 0.5
    -0.5 -0.5
    -0.2 -0.1
    -0.1 0.1
    0.1 -0.1
    0.1 0.1];
dt=delaunayTriangulation(x);
[v,r]=voronoiDiagram(dt);