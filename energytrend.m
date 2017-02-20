aalist=[5,20,50,100];
menergies=zeros(4,3);
un=6;
xxx=1:un;
for i=1:un,
    for j=1:length(aalist);
        k=aalist(j);
        thefolder=['multi_L36c36u',num2str(i),'A36aa',num2str(k),'_0.5_4.5_1n2000000r1000s1001'];
        load([thefolder,'/statistics.mat']);
        menergies(i,j)=mE;
    end
end
figure;
hold on
for i=1:4,
    subplot(2,2,i);
    plot(xxx,menergies(:,i),'o-');
%plot(xxx,menergies(:,i)-menergies(1,i),'o-');
xlabel('unit number');
ylabel('system energy for stable states');
title(['\alpha_A=',num2str(aalist(i)*0.3139),'kT']);
end
% enercurve=zeros(1,2001);
% for j=1:length(aalist);
%     k=aalist(j);
%         subplot(4,1,j);
%         hold on
%         for i=1:4,
%             enercurve(:)=energies(i,j,:);
%         plot(xxx,enercurve);
%         end
%         xlim([0,2000]);
%         xlabel('steps');
%         ylabel('energy');
%         title(['\alpha_A=',num2str(k*0.3139),'kT']);
%         legend('u1','u2','u3','u4');
% end
        