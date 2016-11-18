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

disp('Success!');



