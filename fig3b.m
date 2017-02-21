order=1;
pick0=1;
pick1=2;
pick2=6;
pick3=10;
% pick4=11;
load('alpA~p0_k0.5_L36/alpA~pp0_k0.5_L36/phasequantities.mat');
PQ=PQura;
vq0=PQ(pick0,:);
vqa=PQ(pick1,:);
vqb=PQ(pick2,:);
vqc=PQ(pick3,:);

% vqa=PQ(pick1,:)./(5.*0.3129);
% vqb=PQ(pick2,:)./(25.*0.3129);
% vqc=PQ(pick3,:)./(45.*0.3129);
load('alpA~p0_k0.5_L36/alpA~pp0_k0.5_L36,infalpA/phasequantities.mat');
vqd=PQura;

xi=-2:0.0001:5;
yi0=interp1(xclm,vq0,xi);
f0=polyval(polyfit(xi,yi0,order),xi);
yia=interp1(xclm,vqa,xi);
fa=polyval(polyfit(xi,yia,order),xi);
yib=interp1(xclm,vqb,xi);
fb=polyval(polyfit(xi,yib,order),xi);
yic=interp1(xclm,vqc,xi);
fc=polyval(polyfit(xi,yic,order),xi);
yid=interp1(xclm,vqd,xi);
fd=polyval(polyfit(xi,yid,order),xi);
figure;
hold on
plot(xclm,vq0,'+-');
plot(xclm,vqa,'*-');
plot(xclm,vqb,'^-');
plot(xclm,vqc,'o-');
plot(xclm,vqd,'s-');

% plot(xi,fa,'*-');
% plot(xi,fb,'^-');
% plot(xi,fc,'o-');
% plot(xi,fd,'s-');

% xlim([2,5]);
% figure;
% hold on
% [hAx,hLine1,hLine2] =plotyy(xi,fa,xi,fb);
% % hLine1.LineStyle='--';
% hLine1.Marker='o';
% hLine2.Marker='o';
% [hAx,hLine1,hLine2] =plotyy(xclm,vqa,xclm,vqb);
% hLine1.Marker='o';
% hLine2.Marker='o';
% plot(xi,fa,'-');
% plot(xi,yia,'o');
% figure;
% hold on
% plot(xi,fb,'-');
% plot(xi,yib,'o');

box on

