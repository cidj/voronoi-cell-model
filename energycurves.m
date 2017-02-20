aalist=[100];
energies=zeros(4,3,2001);
xxx=1:2001;
un=6;
for i=1:un,
    for j=1:length(aalist);
        k=aalist(j);
        thefolder=['multi_L36c36u',num2str(i),'A36aa',num2str(k),'_0.5_8_1n2000000r1000s1001'];
        load([thefolder,'/statistics.mat']);
        energies(i,j,:)=meanEE;
    end
end
figure;
enercurve=zeros(1,2001);
for j=1:length(aalist);
    k=aalist(j);
%         subplot(2,2,j);
        hold on
        for i=1:un,
            enercurve(:)=energies(i,j,:);
        plot(xxx,enercurve,'LineWidth',1.5);
        end
        xlim([0,2000]);
        xlabel('steps (10^3)');
        ylabel('energy');
        title(['\alpha_A=',num2str(k*0.3139),'kT']);
        legend('u1','u2','u3','u4','u5','u6');
end
        