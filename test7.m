clear figure
clear all
clc
clear

beta=2.414324e20;

rng('default');

cellh=6;
unitnm=3;
cellv=unitnm*cellh;
celllattx=6;
celllatty=2;
dotnm=cellv*cellh;
cellnm=cellh*cellh;
lengtha=celllattx*cellh;
lengthb=celllatty*cellv;

diary('log.txt');
diary on;
disp('Started!');
accepttimes=0;
rejectedtimes=0;
connecttimes=0;
notconnecttimes=0;
t0=clock;

XY = creatdots( cellv,cellh,celllattx,celllatty );
XY_ext=ext9(lengtha,lengthb,XY);
[ va,vb,polyarea,polyedgelen] = updatevoro1( XY_ext );
%         vb=dex9(vb,dotnm);

Plotfig1(XY_ext, va, vb,unitnm,cellnm);
axis equal;