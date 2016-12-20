function [ vx,vy ] = preparevbs( celcents,va,vb,la,lb )
%PREPAREVBS Summary of this function goes here
%   Detailed explanation goes here
cellnm=length(celcents);
dotnm=length(vb);
unitnm=dotnm/cellnm;
vx=cell(dotnm,1);
vy=cell(dotnm,1);
for i=1:cellnm,
    x1=celcents(i,1)-la;
    x2=celcents(i,1)+la;
    y1=celcents(i,2)-lb;
    y2=celcents(i,2)+lb;
    for j=1:unitnm,
        n=cell2unit(i,j,unitnm);
        for k=1:length(vb{n}),
%             A=fallsquare(va(vb{n}(k),:),x1,x2,y1,y2 );
            A=roundn(fallsquare(va(vb{n}(k),:),x1,x2,y1,y2 ),-4);
            vx{n}(k)=A(1);
            vy{n}(k)=A(2);
        end
    end
end
end

