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
[XY,va,vb,pArea,pPerimeter] = makeready_ext1( cellnm,unitnm, XY,lengtha,lengthb, 0.7);
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
A0=cellarea( cellnm,unitnm, pArea );
As=A0;
Ps=celledge( cellnm,unitnm, pPerimeter,va,vb);
totenergy=totener(a1,a2,a3, A0, Ps, As);
varenergy=varener(a1,a2,a3, A0, Ps, As);
save('Totener.txt','totenergy','-ascii');
save('Varener.txt','varenergy','-ascii');

pace_am=1;

ncycl=1000000;
for i=1:ncycl,
    % %     disp(['i=',num2str(i)]);
    p=floor(rand(1)*dotnm)+1;
    %     angle=pi/4;
    %     pace=1;
    angle=rand(1)*2*pi;
    pace=rand(1)*pace_am;
    % %     disp(['p=',num2str(p),' angle=',num2str(angle*180/pi),' pace=',num2str(pace),' um']);
    %     disp(['p=',num2str(p),' angle=',num2str(angle*180/pi),' pace=',num2str(pace),' um',' pacemin=',num2str(pacemin),' um']);
    tempXY=XY(p,:);
    XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
    
    %1----------
    %     cn=unit2cell(p,unitnm);
    %     pp=cell2unit(cn,1,unitnm);
    %
    %     tempXY=XY(pp:pp+2,:);
    %     XY(pp,:)=move(XY(pp,1),XY(pp,2),angle,pace);
    %     XY(pp+1,:)=move(XY(pp+1,1),XY(pp+1,2),angle,pace);
    %     XY(pp+2,:)=move(XY(pp+2,1),XY(pp+2,2),angle,pace);
    %1----------------
    
    %2-----
    %     tempXY=XY;
    %     for ip=1:dotnm,
    %         XY(ip,:)=move(XY(ip,1),XY(ip,2),angle,pace);
    %     end
    %2-----
    
    XY_ext=ext9(lengtha,lengthb,XY);
    [va_n,vb_next]=voronoin(XY_ext);
    vb_n=dex9(vb_next,dotnm);
    
    %if(checkconnection( unit2cell( p,unitnm ),unitnm,vb_n ))
    if(checkallconnections_new( unitnm,vb_n,vb_next,dotnm ))
        connecttimes=connecttimes+1;
        % %         disp('Connect!');
        
        [ pArea_n, pPerimeter_n ] = AreaandPerimeter( va_n,vb_n,dotnm );
        
        Ast=cellarea( cellnm,unitnm, pArea_n );
        Pst=celledge( cellnm,unitnm, pPerimeter_n,va_n,vb_n);
        newtotenergy=totener(a1,a2,a3, A0, Pst, Ast);
        acc=min(1,exp(-beta*(newtotenergy-totenergy)));
        prorandom=rand(1);
        % %         disp(['()=',num2str(-beta*(newtotenergy-totenergy)),' exp=',num2str(exp(-beta*(newtotenergy-totenergy)))]);
        %         if(1)
        if(prorandom<acc)
            % %             disp('Accepted!');
            accepttimes=accepttimes+1;
            va=va_n;
            vb=vb_n;
            pArea=pArea_n;
            pPerimeter=pPerimeter_n;
            As=Ast;
            Ps=Pst;
            totenergy=newtotenergy;
            varenergy=varener(a1,a2,a3, A0, Ps, As);
            
            XY=fallsquare( XY,0,lengtha,0,lengthb );
            
            if(rem(accepttimes,100)==0)
                disp(['i=',num2str(i)]);
                disp(['minutes=',num2str(etime(clock,t0)/60)]);
                save('Totener.txt','totenergy','-ascii','-append');
                save('Varener.txt','varenergy','-ascii','-append');
                rec=XY';
                save('XY.txt','rec','-ascii','-append');
            end
            %             save(['XY',num2str(i),'.txt'],'XY','-ascii','-append');
            %             disp(['checkallconnections: ',num2str(checkallconnections( unitnm,vb ))]);
            %             Plotfig(XY, va, vb);
            %             axis equal;
            %             %axis([-lengtha,2*lengtha,-lengthb,2*lengthb]);
            %             axis([0,lengtha,0,lengthb]);
        else
            % %             disp('Rejected!');
            rejectedtimes=rejectedtimes+1;
            XY(p,:)=tempXY;
            %1------
            %             XY(pp:pp+2,:)=tempXY;
            %1------
            %2-----
            %             XY=tempXY;
            %2-----
            %             XY3=XY;
            %             disp(['checkequal: ',num2str(checkequal(XY1,XY3))]);
        end
    else
        % %         disp('Not connect!');
        notconnecttimes=notconnecttimes+1;
        XY(p,:)=tempXY;
        %1------
        %         XY(pp:pp+2,:)=tempXY;
        %1------
        %2-----
        %             XY=tempXY;
        %2-----
        %         disp(['checkallconnections: ',num2str(checkallconnections( unitnm,vb ))]);
    end
    % %     disp(['minutes=',num2str(etime(clock,t0)/60)]);
end
disp(['minutes=',num2str(etime(clock,t0)/60)]);
XY_ext=ext9(lengtha,lengthb,XY);
Plotfig1(XY_ext,unitnm,cellnm);
axis equal;
axis([0,lengtha,0,lengthb]);
disp('Successfully finished!');
disp(['connecttimes=',num2str(connecttimes),' notconnecttimes=',num2str(notconnecttimes)]);
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes)]);
diary off;








