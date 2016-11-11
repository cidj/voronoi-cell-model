clear figure
clear all
clc
clear

beta=2.414324e20;

rng('default');

cellh=4;
unitnm=3;
cellv=unitnm*cellh;
celllattx=5;
celllatty=5;
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
[XY,va,vb,polyarea,polyedgelen,polyneibor ] = makeready_ext( cellnm,unitnm, XY,lengtha,lengthb, 0.7);
disp(['minutes=',num2str(etime(clock,t0)/60)]);
rec=XY';
save('XY.txt','rec','-ascii');
% Plotfig(XY, va, vb);
% axis equal;
% axis([0,lengtha,0,lengthb]);

aa=5e-24;
a1=12*aa;
a2=240*aa;
a3=1*aa;
A0=cellarea( cellnm,unitnm, polyarea );
As=A0;
Ps=celledge( cellnm,unitnm, polyedgelen,va,vb);
totenergy=totener(a1,a2,a3, A0, Ps, As);
varenergy=varener(a1,a2,a3, A0, Ps, As);
save('Totener.txt','totenergy','-ascii');
save('Varener.txt','varenergy','-ascii');

pace_am=1;

ncycl=10000;
for i=1:ncycl,
    disp(['i=',num2str(i)]);
    p=floor(rand(1)*dotnm)+1;
    angle=rand(1)*2*pi;
    pace=rand(1)*pace_am;
    %     pacemin=min(polyedgelen{p});
    %     pacepick=min(pace,pacemin);
    %     if(i==16)
    %         XYbefore16=XY;
    %     end
    %     if(i==17)
    %         XYbefore17=XY;
    %     end
    %     if(i==18)
    %         XYbefore18=XY;
    %     end
    disp(['p=',num2str(p),' angle=',num2str(angle*180/pi),' pace=',num2str(pace),' um']);
    %     disp(['p=',num2str(p),' angle=',num2str(angle*180/pi),' pace=',num2str(pace),' um',' pacemin=',num2str(pacemin),' um']);
    tempXY=XY(p,:);
    %     XY1=XY;
    XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
    %     XY2=XY;
    [ va_n,vb_n,polyarea_n,polyedgelen_n,polyneibor_n ] = updatevoro_ext(lengtha,lengthb, XY);
    %if(checkconnection( unit2cell( p,unitnm ),unitnm,vb_n ))
    if(checkallconnections( unitnm,vb_n ))
        connecttimes=connecttimes+1;
        disp('Connect!');
        Ast=cellarea( cellnm,unitnm, polyarea_n );
        Pst=celledge( cellnm,unitnm, polyedgelen_n,va_n,vb_n);
        newtotenergy=totener(a1,a2,a3, A0, Pst, Ast);
        acc=min(1,exp(-beta*(newtotenergy-totenergy)));
        prorandom=rand(1);
        disp(['()=',num2str(-beta*(newtotenergy-totenergy)),' exp=',num2str(exp(-beta*(newtotenergy-totenergy)))]);
        if(prorandom<acc)
            disp('Accepted!');
            accepttimes=accepttimes+1;
            va=va_n;
            vb=vb_n;
            polyarea=polyarea_n;
            polyedgelen=polyedgelen_n;
            polyneibor=polyneibor_n;
            As=Ast;
            Ps=Pst;
            totenergy=newtotenergy;
            varenergy=varener(a1,a2,a3, A0, Ps, As);
            save('Totener.txt','totenergy','-ascii','-append');
            save('Varener.txt','varenergy','-ascii','-append');
            rec=XY';
            save('XY.txt','rec','-ascii','-append');
            %             save(['XY',num2str(i),'.txt'],'XY','-ascii','-append');
            %             disp(['checkallconnections: ',num2str(checkallconnections( unitnm,vb ))]);
            %             Plotfig(XY, va, vb);
            %             axis equal;
            %             %axis([-lengtha,2*lengtha,-lengthb,2*lengthb]);
            %             axis([0,lengtha,0,lengthb]);
        else
            disp('Rejected!');
            rejectedtimes=rejectedtimes+1;
            XY(p,:)=tempXY;
            %             XY3=XY;
            %             disp(['checkequal: ',num2str(checkequal(XY1,XY3))]);
        end
    else
        disp('Not connect!');
        notconnecttimes=notconnecttimes+1;
        XY(p,:)=tempXY;
        %         disp(['checkallconnections: ',num2str(checkallconnections( unitnm,vb ))]);
    end
    disp(['minutes=',num2str(etime(clock,t0)/60)]);
end
Plotfig(XY, va, vb);
axis equal;
axis([0,lengtha,0,lengthb]);
disp('Successfully finished!');
disp(['connecttimes=',num2str(connecttimes),' notconnecttimes=',num2str(notconnecttimes)]);
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes)]);
diary off;








