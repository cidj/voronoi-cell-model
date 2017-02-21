clearvars;
addpath([pwd,'/vorosim']);


ylis=0.7:0.05:1;


names=ylis*36;
llen=length(names);
yname='free energy';
ttlim=200;
otherlim=150;
figure;
for i=1:llen,
%     folder=['cels_L36c36u1A36aa20_0.2_',num2str(names(i)),'_1n100000r1s1'];
folder=['fourlowaa_L',num2str(names(i)),'c36u1A36aa0.95877_0.5_3.5_1n1000000r5s1'];
disp(folder);
    load([folder,'/localcells.mat']);
%     load([folder,'/localcellsus.mat']);
    tt=comed;
    [ xaxi1,~,~,aavE ] = gethist( tt,ttlim,cEE,otherlim );
        [yyy,xaxi2]=hist(tt,ttlim);
        aavf=-log(yyy/sum(yyy));
    subplot(2,4,i);
%     aavv=aav-min(aav);
aavE=aavE-min(aavE);
    plot(aavE,aavf,'o');
%     ylim([0,12]);
%     xlim([0,10]);
    xlabel('total energy');
    ylabel([yname,' (kT)']);
    title(['$\sqrt{a_0}=',num2str(names(i)/36),'$'],'Interpreter','latex');
end
suptitle('free energy - total energy');
suptitle([yname, ': $\alpha_A=0.3 kT;k=0.5;p0=3.5$'],'Interpreter','latex');