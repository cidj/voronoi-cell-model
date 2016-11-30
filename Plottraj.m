function [  ] = Plottraj( file, noofce,lengtha,lengthb )
%PLOTTRAJ Summary of this function goes here
%   Detailed explanation goes here
% file='CePo.txt';
% noofce=18;

pos=load(file);
%status2=pos(:,1);
pos(:,1)=[];
timen=size(pos,1)/2;
celnmd=size(pos,2);
traj=zeros(timen,celnmd,2);
for i=1:timen,
    traj(i,:,1)=pos(2*i-1,:)';
    traj(i,:,2)=pos(2*i,:)';
end
figure;
plot(traj(:,noofce,1),traj(:,noofce,2),'--O','MarkerEdgeColor','g','MarkerFaceColor','g');
for i=1:timen,
%         text(traj(i,noofce,1),traj(i,noofce,2),num2str(i),'FontSize',8);
end
axis equal;
axis([0,lengtha,0,lengthb]);
title(['cell ',num2str(noofce),' trajectory. unit: \mum']);
end

