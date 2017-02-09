clearvars;
addpath([pwd,'/vorosim']);
load('fourcells.mat');
load('map.mat');
llen=length(fourcells);
di=0.2;
peakszero=cell(llen,1);
vallaypsE1234=cell(llen,1);
vallaynsE1234=cell(llen,1);
vallaypsEE=cell(llen,1);
vallaynsEE=cell(llen,1);
vallaypsfg=cell(llen,1);
vallaynsfg=cell(llen,1);

for i=1:llen,
    folder=['fourcells_',num2str(i),'_L25c36u1A36aa20_0.5_-2_1n100000r1s1'];
    load([folder,'/localcells.mat']);
    
    peakszero{i}=find(abs(comed)<di);
    vallaypsE1234{i}=find((abs(cE1234-y1E1234(i))<di)&(abs(comed-x1E1234(i))<di));
    vallaynsE1234{i}=find((abs(cE1234-y2E1234(i))<di)&(abs(comed-x2E1234(i))<di));

    vallaypsEE{i}=find((abs(cEE-y1EE(i))<di)&(abs(comed-x1EE(i))<di));
    vallaynsEE{i}=find((abs(cEE-y2EE(i))<di)&(abs(comed-x2EE(i))<di)); 
    
    vallaypsfg{i}=find(abs(comed-x1fg(i))<di);
    vallaynsfg{i}=find(abs(comed-x2fg(i))<di); 
    
    disp(['typicalshapes: ',num2str(i),' folders processed.']);
end

save('peaksandvallays.mat','peakszero',...
    'vallaypsE1234','vallaynsE1234','vallaypsEE',...
    'vallaynsEE','vallaypsfg','vallaynsfg');


