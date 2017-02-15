% previousfoldername='kk_pp0_L36c36u1A36aa20_0.2_5_1n400000r1000s201';
% tp=401;
% load(fullfile(pwd,previousfoldername,'parameter0.mat'));
% load([previousfoldername,'/parameter0.mat']);

%cells that can move.
% load('fourcells.mat');
% motcels=fourcells(x,:);
% x=1;
% motcels=[31,2,34,24];

loadtimpointcells;

clearvars -except x XY CePo As Ps Es totenergy pArea pPerimeter...
    squareedgelength squarenum unitnm A0guessu aa kk pp0...
    sp spco maxpace motcels;

%folder name
% named=['fourcells_',num2str(x)];
named='fourlowaa';

%number of simulation steps and saving frequency
ncycl=1000000;
recN=5;
recstabsta=1;