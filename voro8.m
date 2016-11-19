clear figure
clear all
clc
clear

beta=2.414324e20;

rng('default');

unith=6;
unitnm=3;
unitv=unitnm*unith;
lengtha=36;
lengthb=36;
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
[XY,va,vb,pArea,pPerimeter] = makeready_ext1( cellnm,unitnm, XY,lengtha,lengthb, 0.7);
CePo=zeros(cellnm,2);
for i=1:cellnm,
    CePo(i,:)=XY(cell2unit(i,1,unitnm),:);
end
CePo=cellcentre( pArea, XY,CePo,lengtha,lengthb,cellnm,unitnm );
disp(['minutes=',num2str(etime(clock,t0)/60)]);

aa=5e-24;
a1=[12*aa,0.7*12*aa];
a2=[240*aa,0.7*240*aa];
a3=[1*aa,0.7*240*aa];
sp=[-1,0];

A0=cellarea( cellnm,unitnm, pArea );
As=A0;
Ps=celledgefor3( cellnm,unitnm, pPerimeter,va,vb);
totenergy=totener(sp,a1,a2,a3, A0, Ps, As);
status=0;
recA=[status,As'];
recP=[status,Ps'];
recXY=[[status;status],XY'];
recCePo=[[status;status],CePo'];
save('Area.txt','recA','-ascii');
save('Perimeter.txt','recP','-ascii');
save('XY.txt','recXY','-ascii');
save('CePo.txt','recCePo','-ascii');

rcpA=[status,pArea'];
rcpP=[status,pPerimeter'];
save('rcpA.txt','rcpA','-ascii');
save('rcpP.txt','rcpP','-ascii');

pace_am=1.0;
aru=0.3;
ard=0.5;
dat=0;
drt=0;

ncycl=10000;
recN=10;
sppaeap=zeros(ncycl,11);
for i=1:ncycl,
    p=floor(rand(1)*dotnm)+1;
    angle=rand(1)*2*pi;
    pace=rand(1)*pace_am;

    tempXY=XY(p,:);
    XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
    XY_ext=ext9(lengtha,lengthb,XY);
    [va_n,vb_next]=voronoin(XY_ext);
    vb_n=dex9(vb_next,dotnm);   
    %if(checkconnection( unit2cell( p,unitnm ),unitnm,vb_n ))
    if(checkallconnections_new2( unitnm,vb_n,vb_next,dotnm ))       
        [ pArea_n, pPerimeter_n ] = AreaandPerimeter( va_n,vb_n,dotnm );
        
        Ast=cellarea( cellnm,unitnm, pArea_n );
        Pst=celledgefor3( cellnm,unitnm, pPerimeter_n,va_n,vb_n);
        newtotenergy=totener(sp,a1,a2,a3, A0, Pst, Ast);
        acc=min(1,exp(-beta*(newtotenergy-totenergy)));
        prorandom=rand(1);
%         disp(['totenergy=',num2str(totenergy),' newtotenergy=',num2str(newtotenergy)]);
%         disp(['()=',num2str(-beta*(newtotenergy-totenergy)),' exp=',num2str(exp(-beta*(newtotenergy-totenergy)))]);
%         if(newtotenergy<totenergy)
%             disp('attention!');
%         end
        %         if(1)
        if(prorandom<acc)
            status=1;
            dat=dat+1;
            accepttimes=accepttimes+1;
            va=va_n;
            vb=vb_n;
            pArea=pArea_n;
            pPerimeter=pPerimeter_n;
            As=Ast;
            Ps=Pst;
            totenergy=newtotenergy;
            
            CePo=cellcentre( pArea, XY,CePo,lengtha,lengthb,cellnm,unitnm );
            
%             XY=fallsquare( XY,0,lengtha,0,lengthb );
            XY(p,:)=fallsquare( XY(p,:),0,lengtha,0,lengthb );
            CePo=fallsquare( CePo,0,lengtha,0,lengthb );

        else           
            status=2;
            drt=drt+1;
            rejectedtimes=rejectedtimes+1;
            XY(p,:)=tempXY;
        end
    else
        status=3;
        notconnecttimes=notconnecttimes+1;
        XY(p,:)=tempXY;
    end
    sppaeap(i,1)=status;
    sppaeap(i,2)=p;
    sppaeap(i,3)=pace;
    sppaeap(i,4)=angle;
    sppaeap(i,5)=totenergy;
    sppaeap(i,6)=acc;
    sppaeap(i,7)=prorandom;
    sppaeap(i,8)=dat;
    sppaeap(i,9)=drt;
    sppaeap(i,10)=ra;
    sppaeap(i,11)=pace_am;
    
    if(rem(i,recN)==0)
        
        ra=dat/(dat+drt);
        if(ra>aru)
            pace_am=pace_am*2;
        end
        if(ra<ard)
            pace_am=pace_am*0.5;
        end     
        dat=0;
        drt=0;
        
        disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),' status=',num2str(status)]);
        recA=[status,As'];
        recP=[status,Ps'];
        recXY=[[status;status],XY'];
        recCePo=[[status;status],CePo'];
        save('Area.txt','recA','-ascii','-append');
        save('Perimeter.txt','recP','-ascii','-append');
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
disp('Successfully finished!');
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes),' notconnecttimes=',num2str(notconnecttimes)]);
diary off;








