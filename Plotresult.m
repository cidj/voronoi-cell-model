% clear figure
% clear all
% clc
% clear
% 
% beta=2.414324e20;
% 
% cellh=6;
% unitnm=3;
% cellv=unitnm*cellh;
% celllattx=6;
% celllatty=2;
% dotnm=cellv*cellh;
% cellnm=cellh*cellh;
% lengtha=celllattx*cellh;
% lengthb=celllatty*cellv;
% 
% aa=5e-24;
% a1=12*aa;
% a2=240*aa;
% a3=1*aa;

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
    if(i==1||i==n/2||i==n)
        ZZ(:,1)=XY(2*i-1,:)';
        ZZ(:,2)=XY(2*i,:)';
        if(i==1)
            pp=1;
        end
        if(i==n/2)
            pp=2;
        end
        if(i==n)
            pp=3;
        end
        subplot(1,3,pp);
        
        %     [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro_bd(ZZ, celllattx,celllatty,cellh,cellv );
        
%         ZZ_bd=abd(ZZ, celllattx,celllatty,celllattx*cellh,celllatty*cellv,cellh,cellv );
        [ va,vb,polyarea,polyedgelen] = updatevoro_ext1(  lengtha,lengthb,ZZ);
        
        %     check=checkallconnections(unitnm,vb);
        %     disp(check);
        Plotfig(ZZ, va, vb,unitnm);
        axis equal;
        %axis([-lengtha,2*lengtha,-lengthb,2*lengthb]);
        axis([0,lengtha,0,lengthb]);
        disp([num2str(i),' line finished!','minutes=',num2str(etime(clock,t0)/60)]);
    end
end