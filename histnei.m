function [  ] = histnei( fn,BB,an,bn,recN,histfigfile,tit  )
%HISTNEI Summary of this function goes here
%   Detailed explanation goes here

timen=size(BB,1);

tt=timen-1;
N=an*bn-1;

hsn=figure('name',fn);

edges=[0.5,1.5,2.5,3.5,4.5,5.5,6.5,7.5,8.5,9.5,10.5,11.5,12.5];
for i=0:N,
    pacetep=floor(i*tt/N)+1;
    subplot(an,bn,i+1);
    hist(BB(pacetep,:),edges);
%     histogram(BB(pacetep,:),edges);
%     histogram(BB(pacetep,:),edgess,'FaceColor','auto','EdgeColor',[0,0,0]);
%     set(gca,'xtick',[0,2,4,6,8,10,12]);
    xlim([0,12]);
    title(['stepnum= ',num2str(recN*(pacetep-1))]);
    if(rem(i+1,bn)==0)
        disp([num2str(i+1),' ', tit,' histfigs finished!']);
    end
end
suptitle(tit);
saveas(hsn,[histfigfile,'.fig']);
close(hsn);

hsn_l=figure('name',[fn,' p']);
hist(BB(pacetep,:),edges);
title(tit,'FontSize',30);
set(gca,'FontSize',30,'LooseInset',get(gca,'TightInset'));
saveas(hsn_l,[histfigfile,'_l.fig']);
close(hsn_l);

disp([tit,' histogram plot success!']);
end

