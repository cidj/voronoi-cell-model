% load(parameterfile);
anadatafile=[foldername,'/','anaresult.mat'];

XYfile=load(unitposifile);
status2=XYfile(:,1);
XYfile(:,1)=[];
timen=size(XYfile,1)/2;
dotnmd=size(XYfile,2);

CePofile=load(cellcenterposifile);
CePofile(:,1)=[];
cellnmd=size(CePofile,2);
CC=cell(timen,1);
for i=1:timen,
    for j=1:cellnmd,
        CC{i}(j,1)=CePofile(2*i-1,j);
        CC{i}(j,2)=CePofile(2*i,j);
    end
end

dZZ=zeros(dotnmd,1);
dcvxys=cell(cellnmd,1);
dcellangles=cell(cellnmd,1);
dcelledges=cell(cellnmd,1);
dcellcvx=zeros(cellnmd,1);
dcellvxn=zeros(cellnmd,1);
dcellvxr=zeros(cellnmd,1);
dcasra=zeros(cellnmd,1);

i=1;
for j=1:dotnmd,
    dZZ(j,1)=XYfile(2*i-1,j)';
    dZZ(j,2)=XYfile(2*i,j)';
end
[ Poneibor,Poedgelen,va,vb0,vb ]  = unitneibors( dZZ,lengtha,lengthb );
[vx,vy]= preparevbs( CC{i},va,vb0,0.5*lengtha,0.5*lengthb );
[cvx,cvy] = vs2cvs(vx,vy,unitnm);

for j=1:cellnmd,
    dcvxys{j}=[cvx{j}',cvy{j}'];
    [dcellangles{j},dcelledges{j},dcellcvx(j),dcellvxn(j)]=anglesedges(dcvxys{j});
    dcellvxr(j)=dcellcvx(j)/dcellvxn(j);
    dcasra(j)=aspectratio(dcvxys{j});
end

