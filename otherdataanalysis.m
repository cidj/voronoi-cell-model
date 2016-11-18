% unitnm=3;
% cellnm=
rcpA=load('rcpA.txt');
status1=rcpA(:,1);
rcpA(:,1)=[];
timen=size(rcpA,1);
% dotnmd=size(rcpA,2);
rcpP=load('rcpP.txt');
rcpP(:,1)=[];
AAA=zeros(timen,cellnm);
PPP=zeros(timen,cellnm);
for i=1:timen,
    for j=1:cellnm,
    AAA(i,j)=sum(rcpA(i,cell2unit(j,1,unitnm):cell2unit(j,unitnm,unitnm)));
    PPP(i,j)=sum(rcpP(i,cell2unit(j,1,unitnm):cell2unit(j,unitnm,unitnm)));
    end
end
