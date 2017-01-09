datafiga=[foldername,'/','quantities'];
datafigb=[foldername,'/','angsedges'];
datafigc=[foldername,'/','Us'];
rdffig=[foldername,'/','RDF'];

%plot quantities
hdata1=figure('name',foldername);
subplot(3,4,1);
plot(xaxis,meanAA);
axis('auto');
title('mean area: \mum^2');
subplot(3,4,2);
plot(xaxis,stdAA);
axis('auto');
title('std of areas: \mum^2');
subplot(3,4,3);
plot(xaxis,meanPP);
axis('auto');
title('mean perimeter: \mum');
subplot(3,4,4);
plot(xaxis,stdPP);
axis('auto');
title('std of perimeters: \mum');
subplot(3,4,5);
plot(xaxis,meanEE);
axis('auto');
title('mean energy: kT');
subplot(3,4,6);
plot(xaxis,stdEE);
axis('auto');
title('std of energy: kT');
subplot(3,4,7);
plot(xaxis,meanNeibor);
axis('auto');
% axis([0,xaxis(end),0,10]);
title('mean of neighbor number');
subplot(3,4,8);
plot(xaxis,stdNeibor);
axis('auto');
title('std of neighbor number');
subplot(3,4,9);
plot(xaxis,meanisoqu);
axis('auto');
% axis([0,xaxis(end),0,1]);
title('mean of isoperimetric quotients');
subplot(3,4,10);
plot(xaxis,stdisoqu);
axis('auto');
title('std of isoperimetric quotients');
subplot(3,4,11);
plot(xaxis,meancap);
axis('auto');
% axis([0,xaxis(end),0,1]);
title('mean of aspect ratios');
subplot(3,4,12);
plot(xaxis,stdcap);
axis('auto');
title('std of aspect ratios');
suptitle('Quantities of cells');
saveas(gcf,[datafiga,'.fig']);

%plot angsedges
hdata2=figure('name',foldername);
subplot(3,4,1);
plot(xaxis,nmofangs);
axis('auto');
title('number of vertices');
subplot(3,4,2);
plot(xaxis,nmofedgs);
axis('auto');
title('number of edges');
subplot(3,4,3);
plot(xaxis,meancellvxn);
axis('auto');
title('number of edges per cell');
subplot(3,4,4);
plot(xaxis,stdcellvxn);
axis('auto');
title('std of number of edges per cell');
subplot(3,4,5);
plot(xaxis,meanedges);
axis('auto');
title('mean of edges lengths');
subplot(3,4,6);
plot(xaxis,stdedges);
axis('auto');
title('std of edges lengths');
subplot(3,4,7);
plot(xaxis,meanangles);
axis('auto');
title('mean of angles');
subplot(3,4,8);
plot(xaxis,stdangles);
axis('auto');
title('std of angles');
subplot(3,4,9);
plot(xaxis,meancellcvx);
axis('auto');
title('mean number of obtuse angles per cell');
subplot(3,4,10);
plot(xaxis,stdcellcvx);
axis('auto');
title('std of number of obtuse angles per cell');
subplot(3,4,11);
plot(xaxis,meancellvxr);
axis('auto');
% axis([0,xaxis(end),0,1]);
title('mean number of obtuse angles ratios per cell');
subplot(3,4,12);
plot(xaxis,stdcellvxr);
axis('auto');
title('std of obtuse angles ratios per cell');
suptitle('Angles and edges');
saveas(gcf,[datafigb,'.fig']);

%plot Us
hdata3=figure('name',foldername);
plot(xaxis,U1ave,'b');
hold on;
plot(xaxis,U2ave,'g');
hold on;
plot(xaxis,U3ave,'m');
axis('auto');
title('U1,U2 and U3 (mean value, unit: kT)');
saveas(gcf,[datafigc,'.fig']);

%plot rdf
hdata4=figure('name',foldername);
plot(Hx(:,1),Hx(:,2));
xlim([0,Hx(end,1)]);
title('RDF');
saveas(gcf,[rdffig,'.fig']);

close(hdata1,hdata2,hdata3,hdata4);