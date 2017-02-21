aalist=[5,20,50];
figure;
for j=1:length(aalist);
    k=aalist(j);
        subplot(2,2,j);
    hold on
    for i=1:4,      
        thefolder=['multi_L36c36u',num2str(i),'A36aa',num2str(k),'_0.5_3.5_1n2000000r1000s1001'];
        load([thefolder,'/anaresult.mat']);
        aaaa=cell2mat(alledges(1001:end));
        histedge=0:0.1:15;
        histresu=histcounts(aaaa,histedge,'Normalization','probability');
        fre=-log(histresu);
        histx=[-histedge(end:-1:2),histedge(2:end)];
        histy=[fre(end:-1:1),fre(1:end)]/2;
        plot (histx/6,histy);
    end
    ylabel('free energy');
    xlabel('L');
    title(['\alpha_A=',num2str(k*0.3139),'kT']);
    legend('u1','u2','u3','u4');
end

