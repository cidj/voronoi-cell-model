order=8;
pickn=11;
% load('k~p0_alpAinf_L36/k_pp0_alpAinf_L36/phasequantities.mat');
load('L~p0_alpAinf_k0.5/phasequantities.mat');
PQ=PQsA;
% load('k~p0_alpA6.2579_L36/phasequantities.mat');
load('L~p0_alpA6.2579_k0.5/phasequantities.mat');
PQ2=PQsA;
figure;
hold on
surf(xclm,yclm,PQ);
shading interp;
surf(xclm,yclm,PQ2);
shading interp;
vqa=PQ(pickn,:);
vqb=PQ2(pickn,:);
% xi=-5:0.25:5;
% yia=interp1(xclm,vqa,xi);
% yib=interp1(xclm,vqb,xi);
% pa=polyfit(xi,yia,order);
% fa=polyval(pa,xi);
% pb=polyfit(xi,yib,order);
% fb=polyval(pb,xi);
figure;
hold on
% % plot(xi,fa);
plot(xclm,vqa,'o-');
% % plot(xi,fb);
plot(xclm,vqb,'o-');

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

