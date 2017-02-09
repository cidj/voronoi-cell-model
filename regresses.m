clearvars;
addpath([pwd,'/vorosim']);
load('fourcells.mat');
% load('map.mat');
llen=length(fourcells);
BE1234=cell(llen,1);
Bfg=cell(llen,1);

ttlim=100;

for i=1:llen,
    folder=['fourcells_',num2str(i),'_L25c36u1A36aa20_0.5_-2_1n100000r1s1'];
    load([folder,'/localcells.mat']);
    M=[ones(t2,1) cAA_1234' edlsurr' car1234' ca1234',ceisoqu_1234'];
    
    BE1234{i}=regress(cE1234',M);
       
    [yyy,xxx]=hist(comed,ttlim);
    yyyln=-log(yyy/sum(yyy));
    p=polyfit(xxx,yyyln,16);
    f=polyval(p,comed');
    Bfg{i}=regress(f,M);
    
    disp(['regresses: ',num2str(i),' folders processed.']);
end
save('regresses.mat','BE1234','Bfg');

