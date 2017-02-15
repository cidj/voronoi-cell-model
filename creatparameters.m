%folder name
named='multi';

% for general
unitnm=4;

%system parameters
squareedgelength=36;
squarenum=6;
A0guessu=36;
% aa=0.3/0.3129;
aa=100;
% alpA=6.0;
kk=0.5;
pp0=8.9;

%another kind of cells index and parameter ratios
sp=[];
spco=[0.5,0.5,0.5];

%cells that can move.
motcels=1:1:squarenum^2;
% motcels=[1,2,3];

%maximum pace
maxpace=6;

%number of simulation steps and saving frequency
ncycl=6000;
recN=100;
recstabsta=ceil(0.5*ncycl/recN)+1;
