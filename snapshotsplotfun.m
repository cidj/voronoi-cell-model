function [  ] = snapshotsplotfun(fn,sp, unitposifile,cellcenterposifile,an,bn,recN,lengtha,lengthb,unitnm,tit,snapshotfile)
%DATAIMAGEPLOTFUN Summary of this function goes here
%   Detailed explanation goes here
XYfile=load(unitposifile);
XYfile(:,1)=[];
timen=size(XYfile,1)/2;
dotnmd=size(XYfile,2);
CePofile=load(cellcenterposifile);
CePofile(:,1)=[];

ZZn=zeros(dotnmd,2);
tt=timen-1;
N=an*bn-1;

hsnap=figure('name',[fn,' p']);

for i=0:N,
    pacetep=floor(i*tt/N)+1;
    ZZn(:,1)=XYfile(2*pacetep-1,:)';
    ZZn(:,2)=XYfile(2*pacetep,:)';
    CCn(:,1)=CePofile(2*pacetep-1,:)';
    CCn(:,2)=CePofile(2*pacetep,:)';
    subplot(an,bn,i+1);
    %     Plotfig4(ZZn,CCn,lengtha,lengthb,unitnm);
    Plotfig6(sp,ZZn,CCn,lengtha,lengthb,unitnm,0,lengtha,0,lengthb,1);
    axis equal;
    axis([0,lengtha,0,lengthb]);
    title(['stepnum= ',num2str(recN*(pacetep-1)),' (tp= ',num2str(pacetep),')']);
    %     if(rem(i+1,bn)==0)
    disp([num2str(i+1),' snapshots finished!']);
    %     end
end
suptitle(tit);
saveas(hsnap,[snapshotfile,'.fig']);
close(hsnap);

hsnap_l=figure('name',[fn,' p']);
Plotfig6(sp,ZZn,CCn,lengtha,lengthb,unitnm,0,lengtha,0,lengthb,0);
axis equal;
axis([0,lengtha,0,lengthb]);
title('Snapshot','FontSize',16);
set(gca,'FontSize',16,'LooseInset',get(gca,'TightInset'));
saveas(hsnap_l,[snapshotfile,'_l.fig']);
close(hsnap_l);

disp([tit,' dataimageplot success!']);
end

