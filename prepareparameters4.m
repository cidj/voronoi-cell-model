sqrta0=nsqrta0;
kk=nkk*sqrta0^2;
pp0=npp0*sqrta0;
alpA=nalpA/sqrta0^4;

betakT=2.4143e20;

A0guess=A0guessu*1e-12;
Amguessu=sqrta0^2*A0guessu;
Amguess=Amguessu*1e-12;

squareedgelength=squarenum*sqrt(Amguessu);
aa=nalpA/(betakT*Amguess^2);

bb=aa*nkk*Amguess;
cc=-2*aa*nkk*npp0*Amguess^1.5;
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

nm_u=['u',num2str(unitnm)];
nm_sqn=['sqn',num2str(squarenum)];
nm_k=['k',num2str(nkk)];
nm_p=['p',num2str(npp0)];
nm_sqa=['sqa',num2str(nsqrta0)];
nm_alA=['alA',num2str(nalpA)];
nm_n=['n',num2str(ncycl)];
nm_r=['r',num2str(recN)];
nm_s=['s',num2str(recstabsta)];

foldername=[named,'_',nm_u,'_',nm_sqn,nm_k,nm_p,nm_sqa,nm_alA,'_',nm_n,nm_r,nm_s];
filename=[foldername,'snapshots.fig'];
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