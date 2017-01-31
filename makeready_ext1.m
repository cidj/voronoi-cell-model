function [ newXY,va,vb,pArea,pPerimeter] = makeready_ext1( cellnm,unitnm, XY,lengtha,lengthb, ratio)
%CHECKREADY Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(XY);
while 1,
    XY_ext=ext9(lengtha,lengthb,XY);
    %     [va,vb1]=voronoin(XY_ext);
    [va,vb1]=voronoiDiagram(delaunayTriangulation(XY_ext));
    %cellnm_ext=cellnm*9;
    vb=dex9(vb1,dotnm);
    [ pArea, pPerimeter ] = AreaandPerimeter( va,vb,dotnm,lengtha,lengthb );
    signx=0;
    for i=1:cellnm,
        for j=1:unitnm,
            k=j+1;
            if(k<=unitnm)
                juth=cell2unit(i,j,unitnm);
                kuth=cell2unit(i,k,unitnm);
                if(neiborcp(juth,kuth,vb)==0)
                    %                     disp(juth);
                    %                     disp(kuth);
                    %                     disp(distance(juth,kuth,XY));
                    signx=1;
                    [XY(juth,:),XY(kuth,:)]=makecloser(XY(juth,:),XY(kuth,:),ratio);
                end
            end
        end
    end
    
    if(signx==0),
        disp('Cells are created!');
        break;
    end
end
newXY=XY;
end

