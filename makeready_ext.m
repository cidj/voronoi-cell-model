function [ newXY,va,vb,polyarea,polyedgelen,polyneibor ] = makeready_ext( cellnm,unitnm, XY,lengtha,lengthb, ratio)
%CHECKREADY Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(XY);
while 1,
    XY_ext=ext9(lengtha,lengthb,XY);
    [ va1,vb1,polyarea1,polyedgelen1,polyneibor1 ] = updatevoro( XY_ext );    
    %cellnm_ext=cellnm*9;
    va=va1;
    vb=dex9(vb1,dotnm);
    polyarea=dex9(polyarea1,dotnm);
    polyedgelen=dex9(polyedgelen1,dotnm);
    %polyneibor=dex9(polyneibor1,dotnm);
    polyneibor=reduceneibor(dex9(polyneibor1,dotnm),dotnm);

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
        disp('ready!');
        break;
    end
end
newXY=XY;
end

