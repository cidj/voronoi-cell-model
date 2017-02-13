clearvars;
% rng('default')
addpath([pwd,'/vorosim']);
previousfoldername='lowaa_L25.2c36u1A36aa0.95877_0.5_3.5_1n400000r1000s201';
load([previousfoldername,'/parameter0.mat']);
load([previousfoldername,'/anaresult.mat']);
tp=401;
makeedgelist;
motcels=fourcells(ol(1),:);
creatparameterscontinue;
prepareparameters;
creatcellscontinue;
t00=clock;
mainsimucontinue;
dataanalysis3;
dostatistics;
VelocityAnalysis;
plotfigures;
deallocalcells;
convertfigs;
disp(['All set: minutes=',num2str(etime(clock,t00)/60)]);
clear all;
% exit;