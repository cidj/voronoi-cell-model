function  [ p,ccw,angles,edges,cvx ] = cellsorders( va,vb,isr )
%CELLSORDERS Summary of this function goes here
%   Detailed explanation goes here
len=length(vb);
p=cell(len,1);
ccw=zeros(len,1);
angles=cell(len,1);
edges=cell(len,1);
cvx=zeros(len,1);
for i=1:len,
 [ p{i},ccw(i),angles{i},edges{i},cvx(i) ] = cellorder( va,vb{i} );
    if(isr(i))
        ccw(i)=-1;
        angles{i}=[];
        edges{i}=[];
        cvx(i)=0;    
    end
end
end

