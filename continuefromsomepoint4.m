
% rng('default')
addpath([pwd,'/vorosim']);
% addpath('E:\VoronoiSim0322/vorosim');
creatparameterscontinue4;
prepareparameters4;
creatcellscontinue;
t00=clock;
mainsimucontinue4;
dataanalysis3;
dostatistics;
VelocityAnalysis;
plotfigures;
deallocalcells;
convertfigs;
disp(['All set: minutes=',num2str(etime(clock,t00)/60)]);
clear all;
% exit;