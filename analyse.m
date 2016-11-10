clear figure
clear all
clc
clear

beta=2.414324e20;

cellh=6;
unitnm=3;
cellv=unitnm*cellh;
celllattx=5;
celllatty=5;
dotnm=cellv*cellh;
cellnm=cellh*cellh;
lengtha=celllattx*cellh;
lengthb=celllatty*cellv;

aa=5e-24;
a1=12*aa;
a2=240*aa;
a3=1*aa;

XY=load('XY.txt');
a=size(XY,1);
b=size(XY,2);
n=a/2;
Z=zeros(n,b,2);
ZZ=zeros(b,2);
E=zeros(n,1);
varE=zeros(n,1);
t0=clock;
for i=1:n,
%     Z(i,:,1)=XY(2*i-1,:)';
%     Z(i,:,2)=XY(2*i,:)';
    ZZ(:,1)=XY(2*i-1,:)';
    ZZ(:,2)=XY(2*i,:)';
    [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro_ext(lengtha,lengthb, ZZ);
    if(i==1)
       A0=cellarea( cellnm,unitnm, polyarea );
    end
    As=cellarea( cellnm,unitnm, polyarea );
    Ps=celledge( cellnm,unitnm, polyedgelen,va,vb);
    E(i)=totener(a1,a2,a3, A0, Ps, As);
    varE(i)=varener(a1,a2,a3, A0, Ps, As);
    disp([num2str(i),' line finished!','minutes=',num2str(etime(clock,t0)/60)]);
end
save('E.txt','E','-ascii');
save('varE.txt','varE','-ascii');
