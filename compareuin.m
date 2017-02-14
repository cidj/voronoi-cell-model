clearvars;
addpath([pwd,'/vorosim']);
load('phasequantitiesu1.mat');
x1=xclm;
picky=1:4:13;
y1=yclm(picky);
z1=PQmcap(picky,:);
figure;
plot(x1,z1');


% load('phasequantities00.mat');