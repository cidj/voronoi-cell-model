clearvars;
alphalist=5;
betalist=7:0.1:10;
xx=0;
figure;
d2mat=zeros(length(betalist),2);
for ali=1:length(alphalist);
    ij=alphalist(ali);
    %     subplot(2,2,ali);
    for kkk=1:length(betalist);
        ik=betalist(kkk);
        xx=xx+1;
%         subplot(5,6,xx);
        folder=['un_u',num2str(ij),'_sqn6k0.5p',num2str(ik),'sqa1alA6_n500000r500s501'];
        load([folder,'\histy.mat']);
        histedge=0:0.1:15;
        histx=[-histedge(end:-1:2),histedge(2:end)];
        histyy=smooth(histy,10);
%         plot(histx/6,histy,'LineWidth',1.5);
dhistyy=diff(histyy)/0.1;
% d2histyym=diff(histyy,2)/0.01;

d2histyy=diff(smooth(dhistyy,10))/0.1;
%         plot(histx/6,histyy,'LineWidth',1.5);
%        axis([-2.5,2.5,1,4]); 

% plot(histx(1:end-1)/6,dhistyy,'LineWidth',1.5);
%        axis([-4,4,-0.5,0.5]); 

plot(histx(2:end-1)/6,d2histyy,'LineWidth',1.5);
       axis([-4,4,-2,2]); 
       d2histyyy=smooth(d2histyy,10);
       thex=d2histyy(length(histx)/2-1);
% thex=histyy(length(histyy)/2+1)-histyy(length(histyy)/2+2);
       disp(thex);


%         title(['p0=',num2str(ik)]);
title(['D2(0)=',num2str(thex)]);
d2mat(xx,1)=ik;
d2mat(xx,2)=thex;

    end
    
    
end
suptitle(['unit number=',num2str(ij)]);
figure;
plot(d2mat(:,1),d2mat(:,2),'o');

thefit=polyfit(d2mat(:,1),d2mat(:,2),1);
they=polyval(thefit,d2mat(:,1));
thea=polyfit(d2mat(:,2),d2mat(:,1),1);
theaa=thea(2);
hold on
plot(d2mat(:,1),they,'-');
title(['unit number=',num2str(ij)]);
