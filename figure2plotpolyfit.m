order=11;
PQ=PQmcap;
vqa0=PQ(7,:);
vqa=PQ(8,:);
vqb=PQ(9,:);
vqc=PQ(10,:);
xi=-2:0.25:5;
yia0=interp1(xclm,vqa0,xi);
yia=interp1(xclm,vqa,xi);
yib=interp1(xclm,vqb,xi);
yic=interp1(xclm,vqc,xi);
pa0=polyfit(xi,yia0,order);
fa0=polyval(pa0,xi);
pa=polyfit(xi,yia,order);
fa=polyval(pa,xi);
pb=polyfit(xi,yib,order);
fb=polyval(pb,xi);
pc=polyfit(xi,yic,order);
fc=polyval(pc,xi);


figure;
% subplot(2,2,2);
hold on
plot(xi,fa0,'*-');
plot(xi,fa,'^-');
% plot(xi,yia,'-');
plot(xi,fb,'o-');
% plot(xi,yib,'-');
plot(xi,fc,'s-');
% plot(xi,yic,'-');
xlim([0,5]);
box on
% grid on

figure;
hold on
plot(xi,yi,'o-');
plot(xclm,vqa,'o','MarkerFaceColor','auto','MarkerSize',7);
plot(xclm,vqb,'o','MarkerFaceColor','auto','MarkerSize',7);
plot(xclm,vqc,'o','MarkerFaceColor','auto','MarkerSize',7);
% figure;
% boxplot(PAQA,xclm);
