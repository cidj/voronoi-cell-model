%previousfoldername='n4a_u1_sqn6k0.5p3.5sqa1alA6_n4000r100s21';

%load(fullfile(pwd,previousfoldername,'parameter0.mat'));
%load([previousfoldername,'/parameter0.mat']);

%tp=ncycl/recN+1;

%cells that can move.
% load('fourcells.mat');
% motcels=fourcells(x,:);
% x=1;
%motcels=[8,10,5,9];
movingcels=1:1:squarenum^2;
% movingcels=[8,3,10,9,15,20,14,5];

loadtimpointcells;

clearvars -except XY CePo As Ps Es totenergy pArea pPerimeter...
    unitnm squarenum nkk npp0 nsqrta0 nalpA...
    sp spco motcels movingcels maxpace A0guessu ;

%folder name
% named=['fourcells_',num2str(x)];
named='n4b';

%number of simulation steps and saving frequency
ncycl=6000000;
recN=10;
recstabsta=1;
