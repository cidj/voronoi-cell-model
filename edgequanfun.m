clearvars;
% addpath([pwd,'/vorosim']);
addpath('D:\ColonialOneDownloads\VoronoiSim/vorosim');

ylis=0:5:50;
xlis=-2:0.5:5;

yclm=ylis;
xclm=xlis;

minilen=1;
edgequan=zeros(length(yclm),length(xclm),7);

yi=0;
for cycy=1:length(yclm);
    yy=yclm(cycy);
    yi=yi+1;
    xi=0;
    for cycx=1:length(xclm);
        xx=xclm(cycx);
        xi=xi+1;
        %         folder=['kk_pp0_L36c36u1A36aa99_',num2str(yy),'_',num2str(xx),'_1n400000r1000s201'];
        %         folder=['squareedgelength_pp0_L',num2str(yy),'c36u1A36aa20_0.5_',num2str(xx),'_1n400000r1000s201'];
        folder=['aa_pp0_L36c36u1A36aa',num2str(yy),'_0.5_',num2str(xx),'_1n400000r1000s201'];
        if(exist(folder,'dir')),
            load([folder,'/parameter0.mat']);
            load([folder,'/anaresult.mat']);
            edgesnumber = celledgesnumber( celledges ,minilen);
            count= celledgesnumcount( edgesnumber );
            meancount=mean(count(recstabsta:end,:),1);
            edgequan(yi,xi,:)=meancount;
        else
            error('Some data is missing!');
        end
        disp(['yy=',num2str(yy),' xx=',num2str(xx)]);
    end
end

save('edgequantities.mat','edgequan','yclm','xclm');


