a=zeros(100,2);
for i=1:100,
    [xx,yy]=unit2cell(i,3);
    a(i,1)=xx;
    a(i,2)=yy;
end
b=zeros(120,1);
k=1;
for i=1:40,
    for j=1:3,
        b(k)=cell2unit(i,j,3);
        k=k+1;
    end
end