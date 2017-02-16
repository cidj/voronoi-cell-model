clearvars;
addpath([pwd,'/vorosim']);
load('fourcells.mat');
llen=length(fourcells);

ttlim=100;
otherlim=150;

zE1234=zeros(llen,1);
x1E1234=zeros(llen,1);
y1E1234=zeros(llen,1);
x2E1234=zeros(llen,1);
y2E1234=zeros(llen,1);
zUa1234=zeros(llen,1);
x1Ua1234=zeros(llen,1);
y1Ua1234=zeros(llen,1);
x2Ua1234=zeros(llen,1);
y2Ua1234=zeros(llen,1);
zUb1234=zeros(llen,1);
x1Ub1234=zeros(llen,1);
y1Ub1234=zeros(llen,1);
x2Ub1234=zeros(llen,1);
y2Ub1234=zeros(llen,1);
zUc1234=zeros(llen,1);
x1Uc1234=zeros(llen,1);
y1Uc1234=zeros(llen,1);
x2Uc1234=zeros(llen,1);
y2Uc1234=zeros(llen,1);

zEE=zeros(llen,1);
x1EE=zeros(llen,1);
y1EE=zeros(llen,1);
x2EE=zeros(llen,1);
y2EE=zeros(llen,1);
zUUa=zeros(llen,1);
x1UUa=zeros(llen,1);
y1UUa=zeros(llen,1);
x2UUa=zeros(llen,1);
y2UUa=zeros(llen,1);
zUUb=zeros(llen,1);
x1UUb=zeros(llen,1);
y1UUb=zeros(llen,1);
x2UUb=zeros(llen,1);
y2UUb=zeros(llen,1);
zUUc=zeros(llen,1);
x1UUc=zeros(llen,1);
y1UUc=zeros(llen,1);
x2UUc=zeros(llen,1);
y2UUc=zeros(llen,1);

zfg=zeros(llen,1);
x1fg=zeros(llen,1);
y1fg=zeros(llen,1);
x2fg=zeros(llen,1);
y2fg=zeros(llen,1);

for i=1:llen,
    folder=['fourcells_',num2str(i),'_L25c36u1A36aa20_0.5_-2_1n100000r1s1'];
    load([folder,'/localcells.mat']);
    tt=comed;
    [ xcE1234,~,~,avcE1234 ] = gethist( tt,ttlim,cE1234,otherlim );
    [ xcUa1234,~,~,avcUa1234 ] = gethist( tt,ttlim,cU1_1234,otherlim );
    [ xcUb1234,~,~,avcUb1234 ] = gethist( tt,ttlim,cU2_1234,otherlim );
    [ xcUc1234,~,~,avcUc1234 ] = gethist( tt,ttlim,cU3_1234,otherlim );
    [ xcEE,~,~,avcEE ] = gethist( tt,ttlim,cEE,otherlim );
    [ xcUUa,~,~,avcUUa ] = gethist( tt,ttlim,cUU1,otherlim );
    [ xcUUb,~,~,avcUUb ] = gethist( tt,ttlim,cUU2,otherlim );
    [ xcUUc,~,~,avcUUc ] = gethist( tt,ttlim,cUU3,otherlim );
    
    [yyy,xfg]=hist(tt,ttlim);
    yfg=-log(yyy/sum(yyy));
    
    [zE1234(i),x1E1234(i),y1E1234(i),x2E1234(i),y2E1234(i)]=potentialheight2(xcE1234,avcE1234');
    [zUa1234(i),x1Ua1234(i),y1Ua1234(i),x2Ua1234(i),y2Ua1234(i)]=potentialheight2(xcUa1234,avcUa1234');
    [zUb1234(i),x1Ub1234(i),y1Ub1234(i),x2Ub1234(i),y2Ub1234(i)]=potentialheight2(xcUb1234,avcUb1234');
    [zUc1234(i),x1Uc1234(i),y1Uc1234(i),x2Uc1234(i),y2Uc1234(i)]=potentialheight2(xcUc1234,avcUc1234');
    [zEE(i),x1EE(i),y1EE(i),x2EE(i),y2EE(i)]=potentialheight2(xcEE,avcEE');
    [zUUa(i),x1UUa(i),y1UUa(i),x2UUa(i),y2UUa(i)]=potentialheight2(xcUUa,avcUUa');
    [zUUb(i),x1UUb(i),y1UUb(i),x2UUb(i),y2UUb(i)]=potentialheight2(xcUUb,avcUUb');
    [zUUc(i),x1UUc(i),y1UUc(i),x2UUc(i),y2UUc(i)]=potentialheight2(xcUUc,avcUUc');
    [zfg(i),x1fg(i),y1fg(i),x2fg(i),y2fg(i)]=potentialheight2(xfg,yfg);
    
    disp(['dealmap4: ',num2str(i),' folders processed.']);
end
save('map4.mat',...
    'zE1234','x1E1234','y1E1234','x2E1234','y2E1234',...
    'zUa1234','x1Ua1234','y1Ua1234','x2Ua1234','y2Ua1234',...
    'zUb1234','x1Ub1234','y1Ub1234','x2Ub1234','y2Ub1234',...
    'zUc1234','x1Uc1234','y1Uc1234','x2Uc1234','y2Uc1234',...
    'zEE','x1EE','y1EE','x2EE','y2EE',...
    'zUUa','x1UUa','y1UUa','x2UUa','y2UUa',...
    'zUUb','x1UUb','y1UUb','x2UUb','y2UUb',...
    'zUUc','x1UUc','y1UUc','x2UUc','y2UUc',...
    'zfg','x1fg','y1fg','x2fg','y2fg');
