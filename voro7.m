clear figure
clear all
clc
clear

beta=2.414324e20;

rng('default');

squareedgelength=36;
unitnm=3;
unith=6;
unitv=unitnm*unith;
lengtha=squareedgelength;
lengthb=squareedgelength;
celledgelength=squareedgelength/unith;
celllattx=lengtha/unith;
celllatty=lengthb/unitv;
dotnm=unitv*unith;
cellnm=dotnm/unitnm;

diary off;
diary('log.txt');
diary on;
disp('Started!');
accepttimes=0;
rejectedtimes=0;
notconnecttimes=0;

t0=clock;

XY = creatdots( unitv,unith,celllattx,celllatty );
% XY = creatdotsnonrand( unitv,unith,celllattx,celllatty );
[XY,va,vb,pArea,pPerimeter] = makeready_ext1( cellnm,unitnm, XY,lengtha,lengthb, 0.7);
CePo=zeros(cellnm,2);
for i=1:cellnm,
    CePo(i,:)=XY(cell2unit(i,1,unitnm),:);
end
CePo=cellcentre( pArea, XY,CePo,lengtha,lengthb,cellnm,unitnm );
disp(['minutes=',num2str(etime(clock,t0)/60)]);

crowdratio=1.0;
A0guessu=36;
A0guess=A0guessu*1e-12;
kk=0.5;
twopp=2.0;
% aa=1e7;
%  aa=1.5;//weekend used.
aa=50;
a1=[kk*aa*A0guess,0.7*kk*aa*A0guess];
a2=[twopp*aa*A0guess^1.5,0.7*twopp*aa*A0guess^1.5];
a3=[1*aa,0.7*1*aa];
sp=[-1,0];

% A0=cellarea( cellnm,unitnm, pArea );
A0=ones(cellnm,1)*A0guessu;
As=A0;
Ps=celledgefor3( cellnm,unitnm, pPerimeter,va,vb);
Es=cellener(sp,a1,a2,a3,A0,Ps,As);
totenergy=sum(Es);
status=0;
recA=[status,As'];
recP=[status,Ps'];
recE=[status,Es'];
recXY=[[status;status],XY'];
recCePo=[[status;status],CePo'];
save('Area.txt','recA','-ascii');
save('Perimeter.txt','recP','-ascii');
save('Energycells.txt','recE','-ascii');
save('XY.txt','recXY','-ascii');
save('CePo.txt','recCePo','-ascii');

rcpA=[status,pArea'];
rcpP=[status,pPerimeter'];
save('rcpA.txt','rcpA','-ascii');
save('rcpP.txt','rcpP','-ascii');

pace_am=0.8;
aru=0.3;
ard=0.5;
dat=0;
drt=0;
dnt=0;
ra=0;
ncycl=1000000;
recN=1000;
sppaeap=zeros(ncycl,12);

save('parameter.mat',...
'celledgelength','unitnm','unith','unitv','lengtha','lengthb','celllattx','celllatty','dotnm','cellnm',...
'crowdratio','A0guessu','A0guess','kk','twopp','aa','a1','a2','a3','sp','pace_am','ncycl','recN');

for i=1:ncycl,
    p=floor(rand(1)*dotnm)+1;
%     p=floor(rand(1)*cellnm)+1;
    angle=rand(1)*2*pi;
    pace=rand(1)*pace_am;
%     pace=0.4;
    tempXY=XY(p,:);
    XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
%     pp1=cell2unit(p,1,unitnm);
%     ppuni=pp1+unitnm-1;
%     tempXY=XY(pp1:ppuni,:);
%     XY(pp1:ppuni,:)=movemore(XY(pp1:ppuni,:),angle,pace);
    XY_ext=ext9(lengtha,lengthb,XY);
    [va_n,vb_next]=voronoin(XY_ext);
    vb_n=dex9(vb_next,dotnm);   
    %if(checkconnection( unit2cell( p,unitnm ),unitnm,vb_n ))
    if(checkallconnections_new2( unitnm,vb_n,vb_next,dotnm ))   
%      if(1)
        [ pArea_n, pPerimeter_n ] = AreaandPerimeter( va_n,vb_n,dotnm );       
        Ast=cellarea( cellnm,unitnm, pArea_n );
        Pst=celledgefor3( cellnm,unitnm, pPerimeter_n,va_n,vb_n);
        Est=cellener(sp,a1,a2,a3,A0,Pst,Ast);
        newenergyp=Est(unit2cell(p,unitnm));
        oldenergyp=Es(unit2cell(p,unitnm));
        deltaenergy=newenergyp-oldenergyp;
        acc=min(1,exp(-beta*deltaenergy));
        prorandom=rand(1);
        if(prorandom<acc)
%          if(deltaenergy<0)
            status=1;
            dat=dat+1;
            accepttimes=accepttimes+1;
            va=va_n;
            vb=vb_n;
            pArea=pArea_n;
            pPerimeter=pPerimeter_n;
            As=Ast;
            Ps=Pst;
            Es=Est;
            totenergy=sum(Es);
            
            CePo=cellcentre( pArea, XY,CePo,lengtha,lengthb,cellnm,unitnm );
            
%             XY=fallsquare( XY,0,lengtha,0,lengthb );
            XY(p,:)=fallsquare( XY(p,:),0,lengtha,0,lengthb );
%             XY(pp1:ppuni,:)=fallsquare( XY(pp1:ppuni,:),0,lengtha,0,lengthb );
            CePo=fallsquare( CePo,0,lengtha,0,lengthb );

        else
            status=2;
            drt=drt+1;
            rejectedtimes=rejectedtimes+1;
            XY(p,:)=tempXY;
%             XY(pp1:ppuni,:)=tempXY;
        end
    else
        status=3;
        dnt=dnt+1;
        notconnecttimes=notconnecttimes+1;
        XY(p,:)=tempXY;
%         XY(pp1:ppuni,:)=tempXY;
    end
    
    sppaeap(i,1)=status;
    sppaeap(i,2)=p;
    sppaeap(i,3)=pace;
    sppaeap(i,4)=angle;
    sppaeap(i,5)=totenergy;
    sppaeap(i,6)=deltaenergy;
    sppaeap(i,7)=exp(-beta*deltaenergy);
    sppaeap(i,8)=prorandom;    
    sppaeap(i,9)=dat;
    sppaeap(i,10)=drt;
    sppaeap(i,11)=dnt;
    sppaeap(i,12)=pace_am;
    
    if(rem(i,recN)==0)
        ra=dat/(dat+drt);
         
        disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),...
            ' dat=',num2str(dat),' drt=',num2str(drt),' dnt=',num2str(dnt),...
            ' ra=',num2str(ra),' pace_am=',num2str(pace_am),' totenergy=',num2str(totenergy)]);
        
%         disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),...
%             ' dat=',num2str(dat),' drt=',num2str(drt),...
%             ' ra=',num2str(ra)]);
        
        if(ra>aru)
            pace_am=pace_am*1.01;
        end
        if(ra<ard)
            pace_am=pace_am*0.99;
        end
        
        dat=0;
        drt=0;
        dnt=0;
        
        recA=[status,As'];
        recP=[status,Ps'];
        recE=[status,Es'];
        recXY=[[status;status],XY'];
        recCePo=[[status;status],CePo'];
        save('Area.txt','recA','-ascii','-append');
        save('Perimeter.txt','recP','-ascii','-append');
        save('Energycells.txt','recE','-ascii','-append');
        save('XY.txt','recXY','-ascii','-append');
        save('CePo.txt','recCePo','-ascii','-append');
        
        rcpA=[status,pArea'];
        rcpP=[status,pPerimeter'];
        save('rcpA.txt','rcpA','-ascii','-append');
        save('rcpP.txt','rcpP','-ascii','-append');       
    end
end
% XY_ext=ext9(lengtha,lengthb,XY);
% Plotfig1(XY_ext,unitnm,cellnm);
% axis equal;
% axis([0,lengtha,0,lengthb]);
save('sppaeap');
save('everything.mat');
disp('Successfully finished!');
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes),' notconnecttimes=',num2str(notconnecttimes)]);
diary off;








