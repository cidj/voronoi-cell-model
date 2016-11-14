function [  newXY,va,vb,polyarea,polyedgelen,polyneibor ] = makeready_bd( cellnm,unitnm, XY,ratio,cellh,cellv, celllattx,celllatty )
%MAKEREADY_BD Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(XY);

while 1,
    
    XY_bd=abd( XY, celllattx,celllatty,celllattx*cellh,celllatty*cellv,cellh,cellv );  
    dotbdnm=length(XY_bd);
    [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro( XY_bd );

    vb(dotnm+1:dotbdnm,:)=[];
    polyarea(dotnm+1:dotbdnm,:)=[];
    polyedgelen(dotnm+1:dotbdnm,:)=[];
    polyneibor(dotnm+1:dotbdnm,:)=[];

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

