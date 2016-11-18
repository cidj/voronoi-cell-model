
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
    for j=1:cellnm,
        E(i,j)=ener( a1,a2,a3,AA0(j),PP(i,j),AA(i,j));
    end
end


% Z=zeros(timen,dotnmd,2);
ZZ=zeros(dotnmd,2);
ceneibo=zeros(timen,cellnm);
t0=clock;
for i=1:timen,
    ZZ(:,1)=XY(2*i-1,:)';
    ZZ(:,2)=XY(2*i,:)';
    ceneibo(i,:)=cellneibors( ZZ,lengtha,lengthb,unitnm )';
    disp(['ceneibo:',num2str(i)]);
end
disp(['minutes=',num2str(etime(clock,t0)/60)]);
disp('Success!');

meanNeibor=mean(ceneibo,2);
stdNeibor=std(ceneibo,0,2);
subplot(2,4,4);
plot(meanNeibor);
title('mean of energy');
subplot(2,4,8);
plot(stdNeibor);
title('std of energy');