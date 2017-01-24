betakT=2.4143e20;
A0guess=A0guessu*1e-12;
% aa=alpA/(betakT*A0guess^2);
bb=aa*kk*A0guess;
cc=-2*aa*kk*pp0*A0guess^1.5;
a1=bb*[1,spco(1)];
a2=cc*[1,spco(2)];
a3=aa*[1,spco(3)];

lengtha=squareedgelength;
lengthb=squareedgelength;

cellh=squarenum;
cellv=squarenum;

unith=cellh; %This should not be changed.
unitv=unitnm*cellv;
dotnm=unitv*unith;
cellnm=cellh*cellv;

unitlattx=lengtha/unith;
unitlatty=lengthb/unitv;
celllattx=lengtha/cellh;
celllatty=lengthb/cellv;

A0=ones(cellnm,1)*A0guessu;

%folder information

%name for square shape:
name_L=['L',num2str(squareedgelength)];
name_c=['c',num2str(squarenum^2)];

%name for general:
name_u=['u',num2str(unitnm)];
name_A=['A',num2str(A0guessu)];
name_aa=['aa',num2str(aa)];
name_pp0=['_',num2str(kk),'_',num2str(pp0),'_1'];
name_n=['n',num2str(ncycl)];
name_r=['r',num2str(recN)];
name_rss=['s',num2str(recstabsta)];

foldername=[named,'_',name_L,name_c,name_u,name_A,name_aa,name_pp0,name_n,name_r,name_rss];
filename=[foldername,'/pm_lengthofedgesconnected.fig'];
if(exist(filename,'file')),
        exit;
%     mkdir(foldername);
else
    mkdir(foldername);
end
parameterfile=[foldername,'/','parameter0.mat'];
cellareafile=[foldername,'/','Area.txt'];
cellperimeterfile=[foldername,'/','Perimeter.txt'];
cellenergyfile=[foldername,'/','Energycells.txt'];
cellcenterposifile=[foldername,'/','CePo.txt'];
unitareafile=[foldername,'/','rcpA.txt'];
unitperimeterfile=[foldername,'/','rcpP.txt'];
unitposifile=[foldername,'/','XY.txt'];
diaryfile=[foldername,'/','log.txt'];
checklinefile=[foldername,'/','checkline.mat'];

save(parameterfile);
disp(['All parameters created: ',foldername]);