clear all;
foldername='un_L25c36u3A36aa30_0.03_0.3_1n1000000r1000s500';
parameterfile=[foldername,'/','parameter0.mat'];
anadatafile=[foldername,'/','anaresult.mat'];

load(parameterfile);
load(anadatafile);
plotan=3;
plotbn=4;
AA=load(cellareafile);
AA(:,1)=[];
PP=load(cellperimeterfile);
PP(:,1)=[];
isoqu=4*pi*AA./PP.^2;
isoqufig=[foldername,'/','isoquhist.png'];
 histV( foldername,isoqu,10,plotan,plotbn,recN,isoqufig,'isoqu' );
meanisoqu=mean(isoqu,2);
stdisoqu=std(isoqu,0,2);

miso=mean(meanisoqu(recstabsta:end));
siso=mean(stdisoqu(recstabsta:end));

subplot(2,1,1);
plot(xaxis,meanisoqu);
axis('auto');
title('mean of isoqu');
subplot(2,1,2);
plot(xaxis,stdisoqu);
axis('auto');
title('std of isoqu');