addpath([pwd,'/vorosim']);
Eu=cell(4,1);
inlis=[1,2,3,4];
len=length(inlis);
figure;
font=16;
for k=1:len,
    j=inlis(k);
    folder=['figures-units_L36c36u',num2str(j),'A36aa20_0.4_2_1n1000000r1000s501'];
    load([folder,'/parameter0.mat']);
    load([folder,'/anaresult.mat']);
    figure;
%     subplot(1,4,k);
    Plotfig4(ZZ{1001},CC{1001},lengtha,lengthb,unitnm);
    axis equal;
    axis([0,lengtha,0,lengthb]);
    set(gca,'xtick',0:6:36,'xticklabel',0:6:36,'fontsize',font);
    set(gca,'ytick',0:6:36,'yticklabel',0:6:36,'fontsize',font);
    title(['\fontsize{', num2str(font), '}',num2str(j),'-unit cells']);
    xlabel('$\mu$m','Interpreter','latex','fontsize',font);
    ylabel('$\mu$m','Interpreter','latex','fontsize',font);

end

