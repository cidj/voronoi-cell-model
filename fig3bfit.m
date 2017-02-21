order=1;
pick0=1;
pick1=2;
pick2=6;
pick3=10;
% pick4=11;
load('alpA~p0_k0.5_L36/alpA~pp0_k0.5_L36/phasequantities.mat');
PQ=PQmcap;
vq0=PQ(pick0,:);
vqa=PQ(pick1,:);
vqb=PQ(pick2,:);
vqc=PQ(pick3,:);

% vqa=PQ(pick1,:)./(5.*0.3129);
% vqb=PQ(pick2,:)./(25.*0.3129);
% vqc=PQ(pick3,:)./(45.*0.3129);
load('alpA~p0_k0.5_L36/alpA~pp0_k0.5_L36,infalpA/phasequantities.mat');
vqd=PQmcap;

xi=-2:0.2:5;
yi0=interp1(xclm,vq0,xi);
yia=interp1(xclm,vqa,xi);
yib=interp1(xclm,vqb,xi);
yic=interp1(xclm,vqc,xi);
yid=interp1(xclm,vqd,xi);
myfittype = fittype('k1/((k2/(x-c1)).^12+1)+c2',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'k1','k2','c1','c2'});
myfit0 = fit(xi',yi0',myfittype, 'Startpoint', [1 1 1 1]);
myfita = fit(xi',yia',myfittype, 'Startpoint', [1 1 1 1]);
myfitb = fit(xi',yib',myfittype, 'Startpoint', [1 1 1 1]);
myfitc = fit(xi',yic',myfittype, 'Startpoint', [1 1 1 1]);
myfitd = fit(xi',yid',myfittype, 'Startpoint', [1 1 1 1]);

% myfuna = cfit(myfita);
% xa=5:0.1:10;
% ya=myfuna(xa);
% figure;
% plot(xa,ya);

figure;
hold on
plot(myfit0,xclm,vq0,'+');
plot(myfita,xclm,vqa,'*');
plot(myfitb,xclm,vqb,'^');
plot(myfitc,xclm,vqc,'o');
plot(myfitd,xclm,vqd,'s');
% plot(xi,yia,'o');
% plot(xi,yib,'o');
% plot(xi,yic,'o');
% xlim([2,5]);


figure;
hold on
% plot(xi,yi,'o-');
% plot(xclm,vqa,'o-');
plot(xclm,vqb,'o-');
% plot(xclm,vqc,'o-');

box on

