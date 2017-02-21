order=8;
PQ=PQedgenumber;
PQ2=PQmP./6;
vqa=PQ(11,:);
vqb=PQ2(11,:);
xi=-5:0.25:5;
yia=interp1(xclm,vqa,xi);
yib=interp1(xclm,vqb,xi);
pa=polyfit(xi,yia,order);
fa=polyval(pa,xi);
pb=polyfit(xi,yib,order);
fb=polyval(pb,xi);
figure;
plot(xi,fb,xclm,vqb);
figure;
hold on
% [hAx,hLine1,hLine2] =plotyy(xi,fa,xi,fb);
% % hLine1.LineStyle='--';
% hLine1.Marker='o';
% hLine2.Marker='o';
[hAx,hLine1,hLine2] =plotyy(xclm,vqa,xclm,vqb);
hLine1.Marker='o';
hLine2.Marker='*';
% plot(xi,fa,'-');
% plot(xi,yia,'o');
% figure;
% hold on
% plot(xi,fb,'-');
% plot(xi,yib,'o');

box on

