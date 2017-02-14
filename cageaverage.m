clearvars;
addpath([pwd,'/vorosim']);
load('fourcells.mat');
load('map4.mat');
% llen=length(fourcells);
hE1234=zE1234-0.5*(y1E1234+y2E1234);
hUa1234=zUa1234-0.5*(y1Ua1234+y2Ua1234);
hUb1234=zUb1234-0.5*(y1Ub1234+y2Ub1234);
hUc1234=zUc1234-0.5*(y1Uc1234+y2Uc1234);
hEE=zEE-0.5*(y1EE+y2EE);
hUUa=zUUa-0.5*(y1UUa+y2UUa);
hUUb=zUUb-0.5*(y1UUb+y2UUb);
hUUc=zUUc-0.5*(y1UUc+y2UUc);
hfg=zfg-0.5*(y1fg+y2fg);

llen=50;
meancagefor4ar=zeros(llen,1);
meancagefor4a=zeros(llen,1);
PPcAA_1234=zeros(llen,1);
PPedlsurr=zeros(llen,1);
PPcar1234=zeros(llen,1);
PPca1234=zeros(llen,1);
PPceisoqu_1234=zeros(llen,1);
for i=1:llen,
    folder=['fourcells_',num2str(i),'_L25c36u1A36aa20_0.5_-2_1n100000r1s1'];
    load([folder,'/cageinfo.mat']);
    load([folder,'/localcells.mat']);
    meancagefor4ar(i)=nanmean(cagefor4ar);
    meancagefor4a(i)=nanmean(cagefor4a);
    
    PPcAA_1234(i)=nanmean(cAA_1234);
    PPedlsurr(i)=nanmean(edlsurr);
    PPceisoqu_1234(i)=nanmean(ceisoqu_1234);
    %     PPcar1234(i)=nanmean(car1234);
    %     PPca1234(i)=nanmean(ca1234);
    
    
    %     disp(['outercages: ',num2str(i),' folders processed.']);
end

M=[ones(llen,1) meancagefor4ar meancagefor4a PPcAA_1234 PPedlsurr,PPceisoqu_1234];

BE1234=regress(hE1234(1:llen),M);
BEE=regress(hEE(1:llen),M);
Bfg=regress(hfg(1:llen),M);
% geom=meancagefor4ar;
% figure;
% subplot(1,3,1);
% plot(geom,hE1234(1:llen),'o');
% subplot(1,3,2);
% plot(geom,hEE(1:llen),'o');
% subplot(1,3,3);
% plot(geom,hfg(1:llen),'o');



