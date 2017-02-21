clear all;
figure;
hold on;
tps=[291,328,364,401];
lala=0;
for iii=1:length(tps),
tp=tps(iii);
foldername='lowaa_L39.6c36u1A36aa20_0.5_3.5_1n400000r1000s201';
load([foldername,'/parameter0.mat']);
load([foldername,'/','theenergy',num2str(tp),'.mat']);
load([foldername,'/','thedataAB',num2str(tp),'.mat']);
load([foldername,'/','thenewNNN',num2str(tp),'.mat']);

% pick=length(aarr)-200;
pick=2000;
alledges=[];
allalledges=[];
for i=pick:length(aarr),
    
    
    edges  = getedgelengthlist( aarr{i},bcel{i},lengtha,lengthb );
    
    snapedges=cell2vec(edges);
    alledges=[alledges;snapedges];
    
    
    
end
allalledges=[allalledges;alledges];
% figure;histogram(alledges,histedge,'Normalization','probability');
histedge=0:0.1:15;
histresu=histcounts(alledges,histedge,'Normalization','probability');
fre=-log(histresu);
histx=[-histedge(end:-1:2),histedge(2:end)];
histy=[fre(end:-1:1),fre(1:end)]/2;
histyy=smooth(histy,10);

lala=lala+1;
% subplot(1,3,lala);

plot(histx/6,histy,'o-','LineWidth',1.5);
ylabel('Free energy (kT)');
xlabel('d (nondimensional)');
% title(['sqrt(a0)=',num2str(nsqrta0)]);
title(['sqrt(a0)=',num2str(squareedgelength/36)]);
% title(['a0=',num2str(nsqrta0^2)]);
axis([-2.5,2.5,1,4.5]);
end
