addpath([pwd,'/vorosim']);
Eu=cell(4,1);
for i=1:4,
    folder=['figures-units_L36c36u',num2str(i),'A36aa20_0.4_2_1n1000000r1000s501'];
%     load([folder,'/parameter0.mat');
%     load([folder,'/anaresult.mat');
    load([folder,'/statistics.mat']);
    Eu{i}=stdAA;
end
xaxis=1:1000:1000001;

figure;
hold on; 
% plot(xaxis,Eu{1},'g-*','LineWidth',2);
% plot(xaxis,Eu{2},'b--+','LineWidth',2);
% plot(xaxis,Eu{3},'r-.x','LineWidth',2);
% plot(xaxis,Eu{4},'k:o','LineWidth',2);
plot(xaxis,Eu{1},'g','LineWidth',2);
plot(xaxis,Eu{2},'b','LineWidth',2);
plot(xaxis,Eu{3},'r','LineWidth',2);
plot(xaxis,Eu{4},'k','LineWidth',2);
% axis([0,30000,20,30]);
% axis([0,30000,-15,30]);
% axis([0,1000001,0,10]);
xlim([0,1000001]);
%     set(gca,'xtick',0:5000:30000,'xticklabel',0:0.5:3,'fontsize',16);
%     set(gca,'ytick',-15:5:30,'yticklabel',-15:5:30,'fontsize',16);
% title(['\fontsize{16}Cell average energy vs simulation steps']);
ylabel('std of area','fontsize',16);
xlabel('Simulation steps (\times10^4)','fontsize',16);