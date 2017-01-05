function [  ] = celldensitiesplots(fn,cellcenterposifile,an,bn,recN,lengtha,lengthb,tit,xnum,ynum,levels,densityfig )
%DATAIMAGEPLOTFUN Summary of this function goes here
%   Detailed explanation goes here
CePofile=load(cellcenterposifile);
CePofile(:,1)=[];
timen=size(CePofile,1)/2;

tt=timen-1;
N=an*bn-1;

hden=figure('name',fn);

for i=0:N,
    pacetep=floor(i*tt/N)+1;
    CCn(:,1)=CePofile(2*pacetep-1,:)';
    CCn(:,2)=CePofile(2*pacetep,:)';
    subplot(an,bn,i+1);
    celldensityplot( CCn(:,1), CCn(:,2), xnum,ynum,levels, [0,lengtha,0,lengthb]);
    axis equal;
    axis([0,lengtha,0,lengthb]);
    title(['stepnum= ',num2str(recN*(pacetep-1))]);
%     if(rem(i+1,bn)==0)
        disp([num2str(i+1),' densityplots finished!']);
%     end  
end
suptitle(tit);
saveas(hden,[densityfig,'.fig']);
close(hden);

hden_l=figure('name',[fn,' p']);
celldensityplot( CCn(:,1), CCn(:,2), xnum,ynum,levels, [0,lengtha,0,lengthb]);
axis equal;
axis([0,lengtha,0,lengthb]);
title('Cell density');
saveas(hden_l,[densityfig,'_l.fig']);
close(hden_l);

disp([tit,' celldensitiesplots success!']);
end



