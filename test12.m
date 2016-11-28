celledgelength=6;
unitnm=3;
unith=4;
unitv=unitnm*unith;
lengtha=unith*celledgelength;
lengthb=unith*celledgelength;
celllattx=lengtha/unith;
celllatty=lengthb/unitv;
dotnm=unitv*unith;
cellnm=dotnm/unitnm;

crowdratio=1.1;
A0guessu=celllattx*celllatty*unitnm*crowdratio;
A0guess=A0guessu*1e-12;
kk=0.5;
twopp=2.0;

aa=500;
a1=[kk*aa*A0guess,0.7*kk*aa*A0guess];
a2=[twopp*aa*A0guess^1.5,0.7*twopp*aa*A0guess^1.5];
a3=[1*aa,0.7*1*aa];
sp=[-1,0];

pace_am=0.5;
aru=0.3;
ard=0.5;
dat=0;
drt=0;
ra=0;
ncycl=2000;
recN=10;

save('parameter.mat',...
'celledgelength','unitnm','unith','unitv','lengtha','lengthb','celllattx','celllatty','dotnm','cellnm',...
'crowdratio','A0guessu','A0guess','kk','twopp','aa','a1','a2','a3','sp','pace_am','ncycl','recN');