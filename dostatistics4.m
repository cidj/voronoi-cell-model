% load([foldername,'/','parameter0.mat']);
% load([foldername,'/','anaresult.mat']);

statfile=[foldername,'/','statistics.mat'];

meanAA=mean(AA,2);
stdAA=std(AA,0,2);
cellnmd=size(AA,2);
mA=mean(meanAA(recstabsta:end));
sA=mean(stdAA(recstabsta:end));

meanPP=mean(PP,2);
stdPP=std(PP,0,2);
mP=mean(meanPP(recstabsta:end));
sP=mean(stdPP(recstabsta:end));

meanEE=mean(EE,2);
stdEE=std(EE,0,2);
mE=mean(meanEE(recstabsta:end));
sE=mean(stdEE(recstabsta:end));

U1ave=mean(U1,2);
U2ave=mean(U2,2);
U3ave=mean(U3,2);
U1std=std(U1,0,2);
U2std=std(U2,0,2);
U3std=std(U3,0,2);
mU1=mean(U1ave(recstabsta:end));
sU1=mean(U1std(recstabsta:end));
mU2=mean(U2ave(recstabsta:end));
sU2=mean(U2std(recstabsta:end));
mU3=mean(U3ave(recstabsta:end));
sU3=mean(U3std(recstabsta:end));

meanNeibor=mean(ceneibo,2);
stdNeibor=std(ceneibo,0,2);
mN=mean(meanNeibor(recstabsta:end));
sN=mean(stdNeibor(recstabsta:end));

meanisoqu=mean(isoqu,2);
stdisoqu=std(isoqu,0,2);
miso=mean(meanisoqu(recstabsta:end));
siso=mean(stdisoqu(recstabsta:end));

save(statfile,...
    'meanAA','stdAA','meanPP','stdPP','meanEE','stdEE',...
    'U1ave','U2ave','U3ave','U1std','U2std','U3std',...
    'meanNeibor','stdNeibor',...
    'meanisoqu','stdisoqu',...
    'mA','sA','mP','sP','mE','sE','mU1','sU1','mU2','sU2','mU3','sU3',...
    'mN','sN','miso','siso');
% clearvars -except foldername t00;
disp('dostatistics finished.');