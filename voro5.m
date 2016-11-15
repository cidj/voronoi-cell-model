clear figure
clear all
clc
clear

beta=2.414324e20;

rng('default');

cellh=6;
unitnm=3;
cellv=unitnm*cellh;
celllattx=6;
celllatty=2;
dotnm=cellv*cellh;
cellnm=cellh*cellh;
lengtha=celllattx*cellh;
lengthb=celllatty*cellv;

diary('log.txt');
diary on;
disp('Started!');
accepttimes=0;
rejectedtimes=0;
connecttimes=0;
notconnecttimes=0;
t0=clock;

XY = creatdots( cellv,cellh,celllattx,celllatty );
[XY_bd,va,vb,polyArea,polyPerimeter ] = newmakeready( cellnm,unitnm, XY,0.7,cellh,cellv, celllattx,celllatty );
disp(['minutes=',num2str(etime(clock,t0)/60)]);
rec=XY_bd';
save('XY_bd.txt','rec','-ascii');

aa=5e-24;
a1=12*aa;
a2=240*aa;
a3=1*aa;
A0=cellarea( cellnm,unitnm, polyArea );
As=A0;
Ps=celledge( cellnm,unitnm, polyPerimeter,va,vb);
totenergy=totener(a1,a2,a3, A0, Ps, As)+totener(a1,a2,a3,polyPerimeter(dotnm:end),polyArea(dotnm:end));
varenergy=varener(a1,a2,a3, A0, Ps, As);
save('Totener.txt','totenergy','-ascii');
save('Varener.txt','varenergy','-ascii');

pace_am=1;

ncycl=50;
for i=1:ncycl,
    disp(['i=',num2str(i)]);
    p=floor(rand(1)*dotnm)+1;
    angle=rand(1)*2*pi;
    pace=rand(1)*pace_am;
    disp(['p=',num2str(p),' angle=',num2str(angle*180/pi),' pace=',num2str(pace),' um']);
    %     disp(['p=',num2str(p),' angle=',num2str(angle*180/pi),' pace=',num2str(pace),' um',' pacemin=',num2str(pacemin),' um']);
    tempXY_bd=XY_bd(p,:);
    %     XY1=XY;
    XY_bd(p,:)=move(XY_bd(p,1),XY_bd(p,2),angle,pace);
    %     XY2=XY;
    [ va_n,vb_n,polyArea_n,polyPerimeter_n] = newupdatevoro( XY_bd,dotnm, celllattx,celllatty,cellh,cellv  );
    %if(checkconnection( unit2cell( p,unitnm ),unitnm,vb_n ))
    if(newcheckallconnections( unitnm,vb_n ))
        connecttimes=connecttimes+1;
        disp('Connect!');
        Ast=cellarea( cellnm,unitnm, polyArea_n );
        Pst=celledge( cellnm,unitnm, polyPerimeter_n,va_n,vb_n);
        newtotenergy=totener(a1,a2,a3, A0, Pst, Ast)+totener(a1,a2,a3,polyPerimeter_n(dotnm:end),polyArea_n(dotnm:end));
        acc=min(1,exp(-beta*(newtotenergy-totenergy)));
        prorandom=rand(1);
        disp(['()=',num2str(-beta*(newtotenergy-totenergy)),' exp=',num2str(exp(-beta*(newtotenergy-totenergy)))]);
        if(prorandom<acc)
            disp('Accepted!');
            accepttimes=accepttimes+1;
            va=va_n;
            vb=vb_n;
            polyArea=polyArea_n;
            polyPerimeter=polyPerimeter_n;
            As=Ast;
            Ps=Pst;
            totenergy=newtotenergy;
            varenergy=varener(a1,a2,a3, A0, Ps, As);
            save('Totener.txt','totenergy','-ascii','-append');
            save('Varener.txt','varenergy','-ascii','-append');
            rec=XY_bd';
            save('XY_bd.txt','rec','-ascii','-append');
        else
            disp('Rejected!');
            rejectedtimes=rejectedtimes+1;
            XY_bd(p,:)=tempXY_bd;
        end
    else
        disp('Not connect!');
        notconnecttimes=notconnecttimes+1;
        XY_bd(p,:)=tempXY_bd;
    end
    disp(['minutes=',num2str(etime(clock,t0)/60)]);
end
Plotfig(XY_bd, va, vb);
axis equal;
axis([0,lengtha,0,lengthb]);
disp('Successfully finished!');
disp(['connecttimes=',num2str(connecttimes),' notconnecttimes=',num2str(notconnecttimes)]);
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes)]);
diary off;








