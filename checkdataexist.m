clearvars;
addpath([pwd,'/vorosim']);

ylis=6:1:10;
% xlis=0:0.2:1;
xlis=7:0.1:10;

% ylis=4:4:56;
% xlis=0:5:50;

yclm=ylis;
xclm=xlis;

PQexist=zeros(length(yclm),length(xclm));

yi=0;
for cycy=1:length(yclm);
    yy=yclm(cycy);
    yi=yi+1;
    xi=0;
    for cycx=1:length(xclm);
        xx=xclm(cycx);
        xi=xi+1;
        folder=['un_u',num2str(yy),'_sqn6k0.5p',num2str(xx),'sqa1alA6_n500000r500s501'];
%         folder=['fourlowaa_L',num2str(yy),'c36u1A36aa',num2str(xx),'_0.5_3.5_1n1000000r5s1'];
%         disp(folder);
%         folder=['squareedgelength_aa_L',num2str(yy),'c36u1A36aa',num2str(xx),'_0_0_1n400000r1000s201'];
%         folder=['kk_pp0_L36c36u1A36aa20_',num2str(yy),'_',num2str(xx),'_1n400000r1000s201'];
        
        file=[folder,'/snapshots.fig'];
        if(exist(file,'file')),
            PQexist(yi,xi)=1;
        else
            PQexist(yi,xi)=0;
            disp(['yy=',num2str(yy),' xx=',num2str(xx)]);
        end
        %         disp(['yy=',num2str(yy),' xx=',num2str(xx)]);
    end
end



