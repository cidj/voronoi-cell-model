order=8;
pick1=3;
pick2=7;
pick3=12;
pick4=13;
load('alpA~p0_k0.5_L36/alpA~pp0_k0.5_L36/phasequantities3n_ed.mat');
PQ=PQedgenumber;
vaa=yclm.*0.3129;
vqa=PQ(:,pick1);
vqb=PQ(:,pick2);
vqc=PQ(:,pick3);
vqd=PQ(:,pick4);

% vqa=PQ(:,pick1)./vaa';
% vqb=PQ(:,pick2)./vaa';
% vqc=PQ(:,pick3)./vaa';
% vqd=PQ(:,pick4)./vaa';

% vqd=pickresult';
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
plot(vaa',vqa,'*-');
% % plot(xi,fb);
plot(vaa',vqb,'^-');
plot(vaa',vqc,'o-');
plot(vaa',vqd,'s-');
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

