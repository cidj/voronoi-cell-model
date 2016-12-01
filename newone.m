% A0guessu=36;
% A0guess=A0guessu*1e-12;
% kk=0.5;
% twopp=2.0;
% sp=[-1,0];
% aa=1;
% a1=[kk*aa*A0guess,0.7*kk*aa*A0guess];
% a2=[twopp*aa*A0guess^1.5,0.7*twopp*aa*A0guess^1.5];
% a3=[1*aa,0.7*1*aa];
% recN=1000;

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
U1=zeros(timen,cellnm);
U2=zeros(timen,cellnm);
U3=zeros(timen,cellnm);
for i=1:timen,
    [E(i,:),U1(i,:),U2(i,:),U3(i,:)]=cellener4( sp,a1,a2,a3,AA0(:),PP(i,:),AA(i,:));
    %     for j=1:cellnm,
    %         E(i,j)=cellener( sp,a1,a2,a3,AA0(j),PP(i,j),AA(i,j));
    %     end
    disp(i);
end
xaxis=zeros(timen,1);
for i=1:timen,
    xaxis(i)=(i-1)*recN;
end
U1tot=sum(U1,2);
U2tot=sum(U2,2);
U3tot=sum(U3,2);
figure;
plot(xaxis,U1tot/49);
hold on;
plot(xaxis,U2tot/49);
hold on;
plot(xaxis,U3tot/49);