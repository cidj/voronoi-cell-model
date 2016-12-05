% BB=load('Area.txt');
% BB=load('Perimeter.txt');
BB=load('Energycells.txt');

status1=BB(:,1);
BB(:,1)=[];
BB0=BB(1,:);
timen=size(BB,1);
cellnmd=size(BB,2);
nbins=10;
tt=timen;
% tt=50;
figure;
for i=0:7,
    pacetep=round(i*tt/7);
    if(pacetep<1)
        pacetep=pacetep+1;
    end
    subplot(2,4,i+1);
    hist(BB(pacetep,:),nbins);
%     h=findobj(gca,'Type','patch');
%     set(h,'FaceColor',[0 .5 .5],'EdgeColor','w');
    title(['stepnum= ',num2str(recN*(pacetep-1))]);
    disp([num2str(i+1),'th hist finished!']);
end

disp('Success!');

