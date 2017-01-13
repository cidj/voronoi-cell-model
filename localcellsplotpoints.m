
% tt=ti;
tt=comed;

h1=figure('Name','cell axis angle');
subplot(2,2,1);
plot(tt,ca1,'r*');
ylim([0,90]);
title('cell: A');
subplot(2,2,2);
plot(tt,ca2,'g*');
ylim([0,90]);
title('cell: B');
subplot(2,2,3);
plot(tt,ca3,'b*');
ylim([0,90]);
title('cell: C');
subplot(2,2,4);
plot(tt,ca4,'m*');
ylim([0,90]);
title('cell: D');
suptitle('cell axis angle');

h2=figure('Name','cell aspect ratio');
subplot(2,2,1);
plot(tt,car1,'r*');
% ylim([0,1]);
title('cell: A');
subplot(2,2,2);
plot(tt,car2,'g*');
% ylim([0,1]);
title('cell: B');
subplot(2,2,3);
plot(tt,car3,'b*');
% ylim([0,1]);
title('cell: C');
subplot(2,2,4);
plot(tt,car4,'m*');
% ylim([0,1]);
title('cell: D');
suptitle('cell aspect ratio');

h3=figure('Name','cell energy');
subplot(2,2,1);
plot(tt,ceE1,'r*');
title('cell: A');
subplot(2,2,2);
plot(tt,ceE2,'g*');
title('cell: B');
subplot(2,2,3);
plot(tt,ceE3,'b*');
title('cell: C');
subplot(2,2,4);
plot(tt,ceE4,'m*');
title('cell: D');
suptitle('cell energy');

h4=figure('Name','pair and total energy');
subplot(2,2,1);
plot(tt,cE13,'r*');
title('cell: A and C');
subplot(2,2,2);
plot(tt,cE24,'g*');
title('cell: B and D');
subplot(2,2,3);
plot(tt,cE1234,'b*');
title('cell: A, B, C and D');
subplot(2,2,4);
plot(tt,cEE,'m*');
title('All cells');
suptitle('total cell energy');

h5=figure('Name','others');
subplot(2,2,1);
plot(tt,ca1234,'r*');
ylim([0,90]);
title('total axis angle');
subplot(2,2,2);
plot(tt,car1234,'g*');
% ylim([0,1]);
title('total aspect ratio');
subplot(2,2,3);
plot(tt,edlsurr,'b*');
title('length of edge surrounding Perimeters');
subplot(2,2,4);
plot(tt,ceisoqu_1234,'m*');
title('length of total isoqu');

h6=figure('Name','cell U1');
subplot(2,2,1);
plot(tt,ceU1_1,'r*');
title('cell: A');
subplot(2,2,2);
plot(tt,ceU1_2,'g*');
title('cell: B');
subplot(2,2,3);
plot(tt,ceU1_3,'b*');
title('cell: C');
subplot(2,2,4);
plot(tt,ceU1_4,'m*');
title('cell: D');
suptitle('cell U1');

h7=figure('Name','pair and total U1');
subplot(2,2,1);
plot(tt,cU1_13,'r*');
title('cell: A and C');
subplot(2,2,2);
plot(tt,cU1_24,'g*');
title('cell: B and D');
subplot(2,2,3);
plot(tt,cU1_1234,'b*');
title('cell: A, B, C and D');
subplot(2,2,4);
plot(tt,cUU1,'m*');
title('All cells');
suptitle('total cell U1');

h8=figure('Name','cell U2');
subplot(2,2,1);
plot(tt,ceU2_1,'r*');
title('cell: A');
subplot(2,2,2);
plot(tt,ceU2_2,'g*');
title('cell: B');
subplot(2,2,3);
plot(tt,ceU2_3,'b*');
title('cell: C');
subplot(2,2,4);
plot(tt,ceU2_4,'m*');
title('cell: D');
suptitle('cell U2');

h9=figure('Name','pair and total U2');
subplot(2,2,1);
plot(tt,cU2_13,'r*');
title('cell: A and C');
subplot(2,2,2);
plot(tt,cU2_24,'g*');
title('cell: B and D');
subplot(2,2,3);
plot(tt,cU2_1234,'b*');
title('cell: A, B, C and D');
subplot(2,2,4);
plot(tt,cUU2,'m*');
title('All cells');
suptitle('total cell U2');

h10=figure('Name','cell U3');
subplot(2,2,1);
plot(tt,ceU3_1,'r*');
title('cell: A');
subplot(2,2,2);
plot(tt,ceU3_2,'g*');
title('cell: B');
subplot(2,2,3);
plot(tt,ceU3_3,'b*');
title('cell: C');
subplot(2,2,4);
plot(tt,ceU3_4,'m*');
title('cell: D');
suptitle('cell U3');

h11=figure('Name','pair and total U3');
subplot(2,2,1);
plot(tt,cU3_13,'r*');
title('cell: A and C');
subplot(2,2,2);
plot(tt,cU3_24,'g*');
title('cell: B and D');
subplot(2,2,3);
plot(tt,cU3_1234,'b*');
title('cell: A, B, C and D');
subplot(2,2,4);
plot(tt,cUU3,'m*');
title('All cells');
suptitle('total cell U3');

h12=figure('Name','cell Areas');
subplot(2,2,1);
plot(tt,ceAA_1,'r*');
title('cell: A');
subplot(2,2,2);
plot(tt,ceAA_2,'g*');
title('cell: B');
subplot(2,2,3);
plot(tt,ceAA_3,'b*');
title('cell: C');
subplot(2,2,4);
plot(tt,ceAA_4,'m*');
title('cell: D');
suptitle('cell Areas');

h13=figure('Name','pair and total Areas');
subplot(2,2,1);
plot(tt,cAA_13,'r*');
title('cell: A and C');
subplot(2,2,2);
plot(tt,cAA_24,'g*');
title('cell: B and D');
subplot(2,2,3);
plot(tt,cAA_1234,'b*');
title('cell: A, B, C and D');

suptitle('total cell Areas');

h14=figure('Name','cell isoqus');
subplot(2,2,1);
plot(tt,ceisoqu_1,'r*');
% ylim([0,1]);
title('cell: A');
subplot(2,2,2);
plot(tt,ceisoqu_2,'g*');
% ylim([0,1]);
title('cell: B');
subplot(2,2,3);
plot(tt,ceisoqu_3,'b*');
% ylim([0,1]);
title('cell: C');
subplot(2,2,4);
plot(tt,ceisoqu_4,'m*');
% ylim([0,1]);
title('cell: D');
suptitle('cell isoqus');


h15=figure('Name','length of neighbor edges');
subplot(2,2,1);
plot(tt,edlabad,'r*');
title('length of edge AB+AD');
subplot(2,2,2);
plot(tt,edlcdcb,'g*');
title('length of edge CB+CD');
subplot(2,2,3);
plot(tt,edlabcd,'b*');
title('length of edge AB+BC+CD+DA');
subplot(2,2,4);
plot(tt,edlabcde,'m*');
title('length of edge AB+BC+CD+DA+common_edge');
suptitle('length of neighbor edges');

saveas(h1,[foldername,'/ps_ca.fig']);
saveas(h2,[foldername,'/ps_car.fig']);
saveas(h3,[foldername,'/ps_ceEa.fig']);
saveas(h4,[foldername,'/ps_ceEb.fig']);
saveas(h5,[foldername,'/ps_others.fig']);
saveas(h6,[foldername,'/ps_ceU1a.fig']);
saveas(h7,[foldername,'/ps_ceU1b.fig']);
saveas(h8,[foldername,'/ps_ceU2a.fig']);
saveas(h9,[foldername,'/ps_ceU2b.fig']);
saveas(h10,[foldername,'/ps_ceU3a.fig']);
saveas(h11,[foldername,'/ps_ceU3b.fig']);
saveas(h12,[foldername,'/ps_ceAAa.fig']);
saveas(h13,[foldername,'/ps_ceAAb.fig']);
saveas(h14,[foldername,'/ps_ceisoqu.fig']);
saveas(h15,[foldername,'/ps_lengthofedgesconnected.fig']);
close(h1,h2,h3,h4,h5,h6,h7,h8,h9,h10,h11,h12,h13,h14,h15);
% suptitle('cell1~cell4 are represented by red,green,blue,magenta');


% figure;
% plot(tt,comed);
% plot(comed,cEE);