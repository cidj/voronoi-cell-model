clearvars;
addpath([pwd,'/vorosim']);

% ylis=4:4:56;
% xlis=-5:0.5:5;
% ylis=0:0.05:0.5;
% xlis=-5:0.5:5;
% ylis=0.05:0.05:0.5;
% xlis=0.5:0.5:5;
ylis=0.7:0.05:1;
% xlis=0:0.2:1;
xlis=0.3;

% ylis=4:4:56;
% xlis=0:5:50;

yclm=ylis*36;
xclm=xlis/0.3129;

PQexist=zeros(length(yclm),length(xclm));
PQ=zeros(length(yclm),length(xclm));

yi=0;
for cycy=1:length(yclm);
    yy=yclm(cycy);
    yi=yi+1;
    xi=0;
    for cycx=1:length(xclm);
        xx=xclm(cycx);
        xi=xi+1;
                folder=['fourlowaa_L',num2str(yy),'c36u1A36aa',num2str(xx),'_0.5_3.5_1n1000000r5s1'];

        %         folder=['details_L36c36u1A36aa20_',num2str(yy),'_',num2str(xx),'_1n1000000r1000s501'];
%         folder=['aa_L36c36u1A36aa',num2str(xx),'_',num2str(yy),'_3.5_1n100000r1s1'];
        %folder=['aa_pp0_L36c36u1A36aa',num2str(xx),'_',num2str(yy),'_3.5_1n400000r1000s201'];
        %         folder=['celsc_L',num2str(yy),'c36u1A36aa20_0.5_',num2str(xx),'_1n100000r1s1'];
        %         folder=['L_p0_aainf_L',num2str(yy),'c36u1A36aa99_0.5_',num2str(xx),'_1n400000r1000s201'];
                file=[folder,'/pm_ceEb.fig'];
        if(exist(file,'file')),
            PQexist(yi,xi)=1;
%             load([folder,'/statistics.mat']);
            %              PQ(yi,xi)=sA/36;
%             PQ(yi,xi)=miso;
                        load([folder,'/parameter0.mat']);
                        load([folder,'/anaresult.mat']);
                        [ ua,up,ura] = simener4( A0,kk,pp0,AA,PP );
                        save([folder,'/anaresultus.mat'],'ua','up','ura');
            
                        c1=motcels(1);
                        c2=motcels(2);
                        c3=motcels(3);
                        c4=motcels(4);
                        ua4=(ua(:,c1)'+ua(:,c2)'+ua(:,c3)'+ua(:,c4)')/4;
                        uaa=nanmean(ua,2)';
                        up4=(up(:,c1)'+up(:,c2)'+up(:,c3)'+up(:,c4)')/4;
                        upa=nanmean(up,2)';
                        ura4=(ura(:,c1)'+ura(:,c2)'+ura(:,c3)'+ura(:,c4)')/4;
                        uraa=nanmean(ura,2)';
                        save([folder,'/localcellsus.mat'],'ua4','uaa','up4','upa','ura4','uraa');
            disp(['Finished: yy=',num2str(yy),' xx=',num2str(xx)]);
        else
            PQexist(yi,xi)=0;
            disp(['Not exist: yy=',num2str(yy),' xx=',num2str(xx)]);
        end
        %         disp(['yy=',num2str(yy),' xx=',num2str(xx)]);
    end
end



