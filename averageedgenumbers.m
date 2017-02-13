hf=figure;
colors=['m','c','r','g','b','y'];
ijs=[5,20,50,100];
tt=1:1:6;
for theij=1:length(ijs),
    ij=ijs(theij);
    ss=zeros(1,6);
    for ik=1:1:6,
        
%         load(['multi_L36c36u',num2str(ik),'A36aa',num2str(ij),'_0.5_3.5_1n2000000r1000s1001\statistics.mat']);
        load(['multi_L36c36u',num2str(ik),'A36aa',num2str(ij),'_0.5_3.5_1n2000000r1000s1001\allmultiuedges.mat']);
aaaa=cell2mat(allmultiuedges(1800:end))/6;
        ss(ik)=mean(aaaa);
    
    end
    plot(tt,ss,'o-');
    hold on
%     title(['aa=',num2str(ij)]);
end

xlabel('unitnumber');
ylabel('mean edge length');
legend('5','20','50','100');