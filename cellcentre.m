function [ cellPos ] =cellcentre( pArea, XY, centre,lenx,leny, cellnm,unitnm )
%PLOTTRAJ Summary of this function goes here
%   Detailed explanation goes here
% pArea=aaaa;
% XY=xxyy;
% centre=c;
% lenx=lengtha;
% leny=lengthb;
% cellnm=1;
% unitnm=3;

cellPos=zeros(cellnm,2);
for i=1:cellnm,
% i=1;
    xup=0;
    yup=0;
    dp=0;
    for j=1:unitnm,
        n=cell2unit(i,j,unitnm);
        xup=xup+pArea(n)*perodist(XY(n,1)-centre(i,1),lenx);
        yup=yup+pArea(n)*perodist(XY(n,2)-centre(i,2),leny);
        dp=dp+pArea(n);
    end
    cellPos(i,1)=centre(i,1)+xup/dp;
    cellPos(i,2)=centre(i,2)+yup/dp;
end
end

