clearvars;
addpath([pwd,'/vorosim']);
load('fourcells.mat');
load('map.mat');
load('peaksandvallays.mat');
llen=length(fourcells);

PPcAA_1234=zeros(llen,1);
PPedlsurr=zeros(llen,1);
PPcar1234=zeros(llen,1);
PPca1234=zeros(llen,1);
PPceisoqu_1234=zeros(llen,1);
for i=1:llen,
    folder=['fourcells_',num2str(i),'_L25c36u1A36aa20_0.5_-2_1n100000r1s1'];
    load([folder,'/localcells.mat']);
%     pz=peakszero{i};
%     pz=vallaypsE1234{i};
%     pz=vallaynsE1234{i};
%     pz=vallaypsEE{i};
%     pz=vallaynsEE{i};
%     pz=vallaypsfg{i};
    pz=vallaynsfg{i};
    
    pcAA_1234=cAA_1234(pz);
    pedlsurr=edlsurr(pz);
    pcar1234=car1234(pz);
    pca1234=ca1234(pz);
    pceisoqu_1234=ceisoqu_1234(pz);
    
    PPcAA_1234(i)=nanmean(pcAA_1234);
    PPedlsurr(i)=nanmean(pedlsurr);
    PPcar1234(i)=nanmean(pcar1234);
    PPca1234(i)=nanmean(pca1234);
    PPceisoqu_1234(i)=nanmean(pceisoqu_1234);
    
    disp(['typicalshapes: ',num2str(i),' folders processed.']);
end

save('meanpeaksandvallays_vallaynsfg.mat','PPcAA_1234','PPedlsurr',...
    'PPcar1234','PPca1234','PPceisoqu_1234');


