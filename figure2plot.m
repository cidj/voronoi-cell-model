
% PQ=1./PQmcap;
PQ=PQmcap;
vqa0=PQ(7,:);
vqa=PQ(8,:);
vqb=PQ(9,:);
vqc=PQ(10,:);
xi=-2:0.2:5;
yia0=interp1(xclm,vqa0,xi);
yia=interp1(xclm,vqa,xi);
yib=interp1(xclm,vqb,xi);
yic=interp1(xclm,vqc,xi);
myfittype = fittype('k1/((k2/(x-c1)).^12+1)+c2',...
    'dependent',{'y'},'independent',{'x'},...
    'coefficients',{'k1','k2','c1','c2'});
myfita0 = fit(xi',yia0',myfittype, 'Startpoint', [1 1 1 1]);
myfita = fit(xi',yia',myfittype, 'Startpoint', [1 1 1 1]);
myfitb = fit(xi',yib',myfittype, 'Startpoint', [1 1 1 1]);
myfitc = fit(xi',yic',myfittype, 'Startpoint', [1 1 1 1]);

% myfuna = cfit(myfita);
% xa=5:0.1:10;
% ya=myfuna(xa);
% figure;
% plot(xa,ya);

figure;
hold on
plot(myfita0,xi,yia0,'*');
plot(myfita,xi,yia,'^');
plot(myfitb,xi,yib,'o');
plot(myfitc,xi,yic,'s');
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
