%folder name
named='themult';

% for general
unitnm=1;

%system parameters
squarenum=8;

nsqrta0=1;
% nalpA=1000*nsqrta0^4;
nalpA=1000;
nkk=0.5/nsqrta0^2;
npp0=8/nsqrta0;

%another kind of cells index and parameter ratios
sp=[];
spco=[0.5,0.5,0.5];

%cells that can move.
motcels=1:1:squarenum^2;
% motcels=[1,2,3];

%cell size and largest moving size
maxpace=6;
A0guessu=36;

%number of simulation steps and saving frequency
ncycl=400000;
recN=1000;
recstabsta=ceil(0.5*ncycl/recN)+1;
