function [  ] = histg( fn,file,nbins,an,bn,recN,histfigfile,tit )
%HIST Summary of this function goes here
%   Detailed explanation goes here
BB=load(file);
BB(:,1)=[];
timen=size(BB,1);

tt=timen-1;
N=an*bn-1;

hsg=figure('name',fn);

for i=0:N,
    pacetep=floor(i*tt/N)+1;
    subplot(an,bn,i+1);
    hist(BB(pacetep,:),nbins);
%     histogram(BB(pacetep,:),nbins);
%     histogram(BB(pacetep,:),nbins,'FaceColor','auto','EdgeColor',[0,0,0]);
    title(['stepnum= ',num2str(recN*(pacetep-1))]);
    if(rem(i+1,bn)==0)
        disp([num2str(i+1),' ', tit,' histfigs finished!']);
    end
end
suptitle(tit);
saveas(hsg,[histfigfile,'.fig']);
close(hsg);

hsg_l=figure('name',[fn,' p']);
hist(BB(pacetep,:),nbins);
title(tit,'FontSize',30);
set(gca,'FontSize',30,'LooseInset',get(gca,'TightInset'));
saveas(hsg_l,[histfigfile,'_l.fig']);
close(hsg_l);

disp([tit,' histogram plot success!']);
end