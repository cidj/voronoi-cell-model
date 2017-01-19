function [ XY ] = maintaindistance( XY,unitnm,dis,la,lb )
%MAINTAINDISTANCE Summary of this function goes here
%   Detailed explanation goes here
cellnm=length(XY)/unitnm;
% la=lengtha;
% lb=lengthb;

for i=1:cellnm,
    n0=cell2unit(i,1,unitnm)-1;
    for j=1:unitnm,
        nj=n0+j;
        xj=XY(nj,1);
        yj=XY(nj,2);
        for k=j+1:unitnm,
            nk=n0+k;
%             disp(['i=',num2str(i),' nj=',num2str(nj),' nk=',num2str(nk)]);
            xk=XY(nk,1);
            yk=XY(nk,2);
            if(distanpero(xj,yj,xk,yk,la,lb)<dis)
                angle=rand(1)*2*pi;
                XY(nj,:)=move(XY(nj,1),XY(nj,2),angle,0.5*dis);
                XY(nj,:)=fallsquare( XY(nj,:),0,la,0,lb );
                XY(nk,:)=move(XY(nk,1),XY(nk,2),angle,-0.5*dis);
                XY(nk,:)=fallsquare( XY(nk,:),0,la,0,lb );
            end
        end
    end
end

end

