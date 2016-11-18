%
% beta=2.414324e20;
%
% cellh=6;
% unitnm=3;
% cellv=unitnm*cellh;
% celllattx=6;
% celllatty=2;
% dotnm=cellv*cellh;
% cellnm=cellh*cellh;
% lengtha=celllattx*cellh;
% lengthb=celllatty*cellv;
%
% aa=5e-24;
% a1=12*aa;
% a2=240*aa;
% a3=1*aa;

prN=10;
XY=load('XY.txt');
status2=XY(:,1);
XY(:,1)=[];
timen=size(XY,1)/2;
dotnmd=size(XY,2);
AA=load('Area.txt');
status1=AA(:,1);
AA(:,1)=[];
AA0=AA(1,:);
PP=load('Perimeter.txt');
PP(:,1)=[];
meanAA=mean(AA,2);
stdAA=std(AA,0,2);
meanPP=mean(PP,2);
stdPP=std(PP,0,2);
cellnm=size(AA,2);
E=zeros(timen,cellnm);
for i=1:timen,
    E(i,:)=cellener( sp,a1,a2,a3,AA0(:),PP(i,:),AA(i,:));
    %     for j=1:cellnm,
    %         E(i,j)=cellener( sp,a1,a2,a3,AA0(j),PP(i,j),AA(i,j));
    %     end
end
meanEE=mean(E,2);
stdEE=std(E,0,2);

% Z=zeros(timen,dotnmd,2);
ZZ=zeros(dotnmd,2);
ceneibo=zeros(timen,cellnm);
ceineibodet=cell(timen,cellnm);
t0=clock;
for i=1:timen,
    ZZ(:,1)=XY(2*i-1,:)';
    ZZ(:,2)=XY(2*i,:)';
%     Z(i,:,1)=ZZ(:,1);
%     Z(i,:,2)=ZZ(:,2);
    [temp1,temp2]=cellneibors( ZZ,lengtha,lengthb,unitnm );
    ceneibo(i,:)=temp1';
    for j=1:cellnm,
        ceineibodet{i,j}=temp2{j};
    end
    if(rem(i,prN)==0),
        disp(['ceneibo:',num2str(i)]);
        disp(['minutes=',num2str(etime(clock,t0)/60)]);
    end
end
disp('Success!');

meanNeibor=mean(ceneibo,2);
stdNeibor=std(ceneibo,0,2);

% save('Z');
save('E');
save('ceneibo');
save('ceineibodet');

save('meanAA.txt','meanAA','-ascii');
save('meanPP.txt','meanPP','-ascii');
save('meanEE.txt','meanEE','-ascii');
save('meanNeibor.txt','meanNeibor','-ascii');
save('stdAA.txt','stdAA','-ascii');
save('stdPP.txt','stdPP','-ascii');
save('stdEE.txt','stdEE','-ascii');
save('stdNeibor.txt','stdNeibor','-ascii');

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
axis([0,xaxis(end),0,10e-20]);
title('mean energy: J');
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
axis([0,xaxis(end),0,3e-20]);
title('std of energy: J');
subplot(2,4,4);
plot(xaxis,meanNeibor);
axis([0,xaxis(end),0,10]);
title('mean of neibor number');
subplot(2,4,8);
plot(xaxis,stdNeibor);
axis([0,xaxis(end),0,1.5]);
title('std of neibornumber');

%
% E=zeros(n,1);
% varE=zeros(n,1);
% t0=clock;
% for i=1:n,
%     if(i==1||i==n/2||i==n)
%         ZZ(:,1)=XY(2*i-1,:)';
%         ZZ(:,2)=XY(2*i,:)';
%         if(i==1)
%             pp=1;
%         end
%         if(i==n/2)
%             pp=2;
%         end
%         if(i==n)
%             pp=3;
%         end
%         subplot(1,3,pp);
%
%         %     [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro_bd(ZZ, celllattx,celllatty,cellh,cellv );
%
% %         ZZ_bd=abd(ZZ, celllattx,celllatty,celllattx*cellh,celllatty*cellv,cellh,cellv );
%     ZZ_ext=ext9(lengtha,lengthb,ZZ);
%     [va,vb_n]=voronoin(ZZ_ext);
%     vb=dex9(vb_n,dotnm);
%
%         %     check=checkallconnections(unitnm,vb);
%         %     disp(check);
%         figure;
%         Plotfig(ZZ, va, vb,unitnm);
%         axis equal;
%         %axis([-lengtha,2*lengtha,-lengthb,2*lengthb]);
%         axis([0,lengtha,0,lengthb]);
%         disp([num2str(i),' line finished!','minutes=',num2str(etime(clock,t0)/60)]);
%     end
% end