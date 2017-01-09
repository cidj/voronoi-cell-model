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

meancap=nanmean(casra,2);
stdcap=nanstd(casra,0,2);
mcap=mean(meancap(recstabsta:end));
scap=mean(stdcap(recstabsta:end));

meanmcaa=nanmean(cmaa,2);
stdmcaa=nanstd(cmaa,0,2);
mmcaa=mean(meanmcaa(recstabsta:end));
smcaa=mean(stdmcaa(recstabsta:end));

meanisoqu=mean(isoqu,2);
stdisoqu=std(isoqu,0,2);
miso=mean(meanisoqu(recstabsta:end));
siso=mean(stdisoqu(recstabsta:end));

meancellcvx=mean(cellcvx,2);
stdcellcvx=std(cellcvx,0,2);
mcecvx=mean(meancellcvx(recstabsta:end));
scecvx=mean(stdcellcvx(recstabsta:end));

meancellvxn=mean(cellvxn,2);
stdcellvxn=std(cellvxn,0,2);
mcevxn=mean(meancellvxn(recstabsta:end));
scevxn=mean(stdcellvxn(recstabsta:end));

meancellvxr=mean(cellvxr,2);
stdcellvxr=std(cellvxr,0,2);
mcevxr=mean(meancellvxr(recstabsta:end));
scevxr=mean(stdcellvxr(recstabsta:end));

meanangles=zeros(timen,1);
meanedges=zeros(timen,1);
stdangles=zeros(timen,1);
stdedges=zeros(timen,1);
for i=1:timen,
meanangles(i)=nanmean(allangles{i});
meanedges(i)=nanmean(alledges{i});
stdangles(i)=nanstd(allangles{i});
stdedges(i)=nanstd(alledges{i});
end
mangs=mean(meanangles(recstabsta:end));
sangs=mean(stdangles(recstabsta:end));
medgs=mean(meanedges(recstabsta:end));
sedgs=mean(stdedges(recstabsta:end));

save(statfile,...
    'meanAA','stdAA','meanPP','stdPP','meanEE','stdEE',...
    'U1ave','U2ave','U3ave','U1std','U2std','U3std',...
    'meanNeibor','stdNeibor',...
    'meancap','stdcap',...
    'meanmcaa','stdmcaa','mmcaa','smcaa',...
    'meanisoqu','stdisoqu',...
    'meancellcvx','stdcellcvx',...
    'meancellvxn','stdcellvxn',...
    'meancellvxr','stdcellvxr',...
    'meanangles','stdangles',...
    'meanedges','stdedges',...
    'mA','sA','mP','sP','mE','sE','mU1','sU1','mU2','sU2','mU3','sU3',...
    'mcecvx','scecvx','mcevxn','scevxn','mcevxr','scevxr',...
    'mN','sN','mcap','scap','miso','siso',...
    'mangs','sangs','medgs','sedgs');
% clearvars -except foldername t00;
disp('dostatistics finished.');