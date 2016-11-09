function [ newXY,va,vb,polyarea,polyedgelen,polyneibor ] = makeready( cellnm,unitnm, XY,ratio)
%CHECKREADY Summary of this function goes here
%   Detailed explanation goes here
while 1,
    [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro( XY );    

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

