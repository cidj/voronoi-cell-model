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
XYfile=load('XY.txt');
status2=XYfile(:,1);
XYfile(:,1)=[];
timen=size(XYfile,1)/2;
dotnmd=size(XYfile,2);

ZZn=zeros(dotnmd,2);
figure;
for i=0:7,
    pacetep=round(i*timen/7);
    if(pacetep<1)
        pacetep=pacetep+1;
    end
    ZZn(:,1)=XYfile(2*pacetep-1,:)';
    ZZn(:,2)=XYfile(2*pacetep,:)';
    subplot(2,4,i+1);
    Plotfig2(ZZn,lengtha,lengthb,unitnm);
    axis equal;
    axis([0,lengtha,0,lengthb]);
    title(['stepnum= ',num2str(recN*(pacetep-1))]);
    disp([num2str(i+1),'th finished!']);
end
% ZZ1=zeros(dotnmd,2);
% ZZ2=zeros(dotnmd,2);
% aaa=1;
% bbb=1000;
% ZZ1(:,1)=XYfile(2*aaa-1,:)';
% ZZ1(:,2)=XYfile(2*aaa,:)';
% ZZ2(:,1)=XYfile(2*bbb-1,:)';
% ZZ2(:,2)=XYfile(2*bbb,:)';
% figure;
% subplot(2,4,1);
% Plotfig2(ZZ1,lengtha,lengthb,unitnm);
% axis equal;
% axis([0,lengtha,0,lengthb]);
% subplot(2,4,2);
% Plotfig2(ZZ2,lengtha,lengthb,unitnm);
% axis equal;
% axis([0,lengtha,0,lengthb]);
disp('Success!');

