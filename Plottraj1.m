function [  ] = Plottraj1( CC, noofce,lengtha,lengthb,linecolor,dotcolor )
%PLOTTRAJ Summary of this function goes here
%   Detailed explanation goes here
% file='CePo.txt';
% noofce=18;

timen=length(CC);
% celnmd=length(CC{1});
la=lengtha/2;
lb=lengthb/2;
% figure;
for i=1:timen-1,
    x1=CC{i}(noofce,1);
    x2=CC{i+1}(noofce,1);
    y1=CC{i}(noofce,2);
    y2=CC{i+1}(noofce,2);
%     if (abs(x2-x1)>la)
%         if(x1<x2)
%             x1n=x1+lengtha;
%             x2n=x2-lengtha;
    plot([x1,x2],[y1,y2],'Color',linecolor,'MarkerEdgeColor',dotcolor,'MarkerFaceColor',dotcolor);
    %     text(CC{i}(noofce,1),CC{i}(noofce,2),num2str(i),'FontSize',8);
    disp([CC{i}(noofce,1),' ',CC{i}(noofce,2)]);
end
axis equal;
axis([0,lengtha,0,lengthb]);
title(['cell ',num2str(noofce),' trajectory. unit: \mum']);
end

