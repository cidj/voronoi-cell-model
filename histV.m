function [  ] = histV( fn,BB,nbins,an,bn,recN,speedhistfig,tit,axi )
%HISTV Summary of this function goes here
%   Detailed explanation goes here
tt=size(BB,1)-1;

N=an*bn-1;

hsv=figure('name',fn);

for i=0:N,
    pacetep=floor(i*tt/N)+1;
    subplot(an,bn,i+1);
    hist(BB(pacetep,:),nbins);
    axis(axi);
    title(['stepnum= ',num2str(recN*(pacetep-1))]);
    if(rem(i+1,bn)==0)
        disp([num2str(i+1),' ', tit,' histfigs finished!']);
    end
end
suptitle(tit);
saveas(hsv,[speedhistfig,'.fig']);
close(hsv);

hsv_l=figure('name',[fn,' p']);
hist(BB(pacetep,:),nbins);
axis(axi);
title(tit,'FontSize',30);
set(gca,'FontSize',30,'LooseInset',get(gca,'TightInset'));
saveas(hsv_l,[speedhistfig,'_l.fig']);
close(hsv_l);

disp([tit,' histogram plot success!']);
end

