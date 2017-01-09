clearvars -except foldername t00
file=dir([foldername,'\*.fig']);
for n=1:length(file),
    filename=[foldername,'\',file(n).name];
    newname=filename(1:end-4);
    h=openfig(filename,'new','invisible');
    set(gcf,'outerposition',get(0,'screensize'));
    saveas(h,newname,'png');
    close(h);
    disp(['cf: ',num2str(n)]);
end