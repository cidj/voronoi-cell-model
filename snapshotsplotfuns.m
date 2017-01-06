function [  ] = snapshotsplotfuns(fn,sp, vAs,vcs,cellcenterposifile,an,bn,recN,lengtha,lengthb,tit,snapshotfile)
%DATAIMAGEPLOTFUN Summary of this function goes here
%   Detailed explanation goes here

CePofile=load(cellcenterposifile);
CePofile(:,1)=[];
timen=size(CePofile,1)/2;
cellnmd=size(CePofile,2);

tt=timen-1;
N=an*bn-1;

hsnaps=figure('name',[fn,' S']);

for i=0:N,
    pacetep=floor(i*tt/N)+1;
    CCn(:,1)=CePofile(2*pacetep-1,:)';
    CCn(:,2)=CePofile(2*pacetep,:)';
    vAst=vAs{pacetep};
    vcst=cell(cellnmd,1);
    for j=1:cellnmd,
        vcst{j}=vcs{pacetep,j};
    end
    subplot(an,bn,i+1);
    Plotfig6s(sp,vAst,vcst,CCn,0,lengtha,0,lengthb,0,lengtha,0,lengthb,1);
    axis equal;
    axis([0,lengtha,0,lengthb]);
    title(['stepnum= ',num2str(recN*(pacetep-1)),' (tp= ',num2str(pacetep),')']);
%     if(rem(i+1,bn)==0)
        disp([num2str(i+1),' snapshots finished!']);
%     end  
end
suptitle(tit);
saveas(hsnaps,[snapshotfile,'.fig']);
close(hsnaps);

hsnap_l=figure('name',[fn,' p']);
Plotfig6s(sp,vAst,vcst,CCn,0,lengtha,0,lengthb,0,lengtha,0,lengthb,0);
axis equal;
axis([0,lengtha,0,lengthb]);
title('Snapshot','FontSize',16);
set(gca,'FontSize',16,'LooseInset',get(gca,'TightInset'));
saveas(hsnap_l,[snapshotfile,'_l.fig']);
close(hsnap_l);

disp([tit,' dataimageplot success!']);
end

