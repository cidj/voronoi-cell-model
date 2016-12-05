XYfile=load(unitposifile);
status2=XYfile(:,1);
XYfile(:,1)=[];
timen=size(XYfile,1)/2;
dotnmd=size(XYfile,2);
CePofile=load(cellcenterposifile);
CePofile(:,1)=[];

ZZn=zeros(dotnmd,2);
tt=timen-1;
figure;
for i=0:15,
    pacetep=floor(i*tt/15)+1;
    ZZn(:,1)=XYfile(2*pacetep-1,:)';
    ZZn(:,2)=XYfile(2*pacetep,:)';
    CCn(:,1)=CePofile(2*pacetep-1,:)';
    CCn(:,2)=CePofile(2*pacetep,:)';
    subplot(4,4,i+1);
    Plotfig4(ZZn,CCn,lengtha,lengthb,unitnm);
    axis equal;
    axis([0,lengtha,0,lengthb]);
    title(['stepnum= ',num2str(recN*(pacetep-1))]);
    disp([num2str(i+1),'th snapshot finished!']);
end
saveas(gcf,snapshotfig);
disp('dataimageplot success!');

