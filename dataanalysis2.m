beta=2.414324e20;
prN=10;
XYfile=load('XY.txt');
status2=XYfile(:,1);
XYfile(:,1)=[];
timen=size(XYfile,1)/2;
dotnmd=size(XYfile,2);
AA=load('Area.txt');
status1=AA(:,1);
AA(:,1)=[];
AA0=AA(1,:);
PP=load('Perimeter.txt');
PP(:,1)=[];
EE=load('Energycells.txt');
EE(:,1)=[];
EE=EE*beta;
meanAA=mean(AA,2);
stdAA=std(AA,0,2);
meanPP=mean(PP,2);
stdPP=std(PP,0,2);
meanEE=mean(EE,2);
stdEE=std(EE,0,2);
% % % cellnm=size(AA,2);
% % % E=zeros(timen,cellnm);
% % % for i=1:timen,
% % %     E(i,:)=cellener( sp,a1,a2,a3,AA0(:),PP(i,:),AA(i,:));
% % %     %     for j=1:cellnm,
% % %     %         E(i,j)=cellener( sp,a1,a2,a3,AA0(j),PP(i,j),AA(i,j));
% % %     %     end
% % % end
% % % meanEE=mean(E,2);
% % % stdEE=std(E,0,2);
% % % 
% % % save('status1');
% % % save('E');

save('meanAA.txt','meanAA','-ascii');
save('meanPP.txt','meanPP','-ascii');
save('meanEE.txt','meanEE','-ascii');
save('stdAA.txt','stdAA','-ascii');
save('stdPP.txt','stdPP','-ascii');
save('stdEE.txt','stdEE','-ascii');

% recN=
xaxis=zeros(timen,1);
for i=1:timen,
    xaxis(i)=(i-1)*recN;
end
figure;
subplot(2,4,1);
plot(xaxis,meanAA);
axis([0,xaxis(end),0,40]);
title('mean area: \mum^2');
subplot(2,4,2);
plot(xaxis,meanPP);
axis([0,xaxis(end),0,30]);
title('mean perimeter: \mum');
subplot(2,4,3);
plot(xaxis,meanEE);
axis('auto');
% axis([0,xaxis(end),0,0.15e-16]);
title('mean energy: kT');
subplot(2,4,5);
plot(xaxis,stdAA);
axis([0,xaxis(end),0,20]);
title('std of area: \mum^2');
subplot(2,4,6);
plot(xaxis,stdPP);
axis([0,xaxis(end),0,8]);
title('std of perimeter: \mum');
subplot(2,4,7);
plot(xaxis,stdEE);
axis('auto');
% axis([0,xaxis(end),0,0.3e-17]);
title('std of energy: kT');

% ZZ=zeros(dotnmd,2);
% ceneibo=zeros(timen,cellnm);
% ceineibodet=cell(timen,cellnm);
% t0=clock;
% for i=1:timen,
%     ZZ(:,1)=XYfile(2*i-1,:)';
%     ZZ(:,2)=XYfile(2*i,:)';
% %     Z(i,:,1)=ZZ(:,1);
% %     Z(i,:,2)=ZZ(:,2);
%     [temp1,temp2]=cellneibors( ZZ,lengtha,lengthb,unitnm );
%     ceneibo(i,:)=temp1';
%     for j=1:cellnm,
%         ceineibodet{i,j}=temp2{j};
%     end
%     if(rem(i,prN)==0),
%         disp(['ceneibo:',num2str(i)]);
%         disp(['minutes=',num2str(etime(clock,t0)/60)]);
%     end
% end

% save('ceneibo');
% save('ceineibodet');
% meanNeibor=mean(ceneibo,2);
% stdNeibor=std(ceneibo,0,2);
% save('meanNeibor.txt','meanNeibor','-ascii');
% save('stdNeibor.txt','stdNeibor','-ascii');

% subplot(2,4,4);
% plot(xaxis,meanNeibor);
% axis([0,xaxis(end),0,10]);
% title('mean of neibor number');
% subplot(2,4,8);
% plot(xaxis,stdNeibor);
% axis([0,xaxis(end),0,1.5]);
% title('std of neibornumber');

disp('Success!');