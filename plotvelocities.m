datafigspeed=[foldername,'/','Speeds'];
speedhistfig=[foldername,'/','hists_speed'];

hdataspeed=figure('name',foldername);
subplot(2,2,1);
plot(xaxis(2:end),meanVV);
axis('auto');
title('mean of velocity');
subplot(2,2,2);
plot(xaxis(2:end),stdVV);
axis('auto');
title('std of velocity');
subplot(2,2,3);
plot(saxis,meanSqDi);
axis('auto');
title('mean square displacement');
subplot(2,2,4);
plot(saxis,stdSqDi);
axis('auto');
title('std of square displacements');
suptitle('Speeds plots');
saveas(hdataspeed,[datafigspeed,'.fig']);
close(hdataspeed);

histV( foldername,Vcel,10,plotan,plotbn,recN,speedhistfig,'Speeds','auto' );