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
suptitle('Quantities of cells');
saveas(gcf,[datafiga,'.fig']);

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

close(hdata1,hdata3,hdata4);
