clear all;
% rng('default')
addpath([pwd,'/vorosim']);
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