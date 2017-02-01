% load(parameterfile);
% loadcells;

accepttimes=0;
rejectedtimes=0;
notconnecttimes=0;
aru=0.3;
ard=0.5;
pace_am=0.8;
dat=0;
drt=0;
dnt=0;
ra=0;
sppaeap=zeros(ncycl,8);
t0=clock;
disp('Starting!');

for i=1:ncycl,
    p1=motcels(floor(rand(1)*length(motcels))+1);
    p2=floor(rand(1)*unitnm)+1;
    p=cell2unit(p1,p2,unitnm);
    %     p=0;
    %     while(~ismember(unit2cell(p,unitnm),motcels))
    %         p=floor(rand(1)*dotnm)+1;
    %     end
    %     p=floor(rand(1)*dotnm)+1;
    angle=rand(1)*2*pi;
    pace=rand(1)*pace_am;
    tempXY=XY(p,:);
    XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
    XY(p,:)=fallsquare( XY(p,:),0,lengtha,0,lengthb );
    XY_ext=ext9(lengtha,lengthb,XY);
    %     [va_n,vb_next]=voronoin(XY_ext);
    [va_n,vb_next]=voronoiDiagram(delaunayTriangulation(XY_ext));
    vb_n=dex9(vb_next,dotnm);
    if(checkallconnectionsu123( unitnm,vb_n,vb_next,dotnm ))
        [ pArea_n, pPerimeter_n ] = AreaandPerimeter( va_n,vb_n,dotnm,lengtha,lengthb);
        Ast=cellarea( cellnm,unitnm, pArea_n );
        Pst=celledgefo( cellnm,unitnm, pPerimeter_n,va_n,vb_n);
        Est=cellener4(sp,a1,a2,a3,A0,Pst,Ast);
        newtotenergy=sum(Est);
        deltaenergy=newtotenergy-totenergy;
        acc=min(1,exp(-deltaenergy));
        prorandom=rand(1);
        if(prorandom<acc)
%         if(deltaenergy<0)
%         if(1)
            status=1;
            dat=dat+1;
            accepttimes=accepttimes+1;
            pArea=pArea_n;
            pPerimeter=pPerimeter_n;
            As=Ast;
            Ps=Pst;
            Es=Est;
            totenergy=newtotenergy;
            CePo=cellcentre( pArea, XY,CePo,lengtha,lengthb,cellnm,unitnm );
            CePo=fallsquare( CePo,0,lengtha,0,lengthb );
        else
            status=2;
            drt=drt+1;
            rejectedtimes=rejectedtimes+1;
            XY(p,:)=tempXY;
        end
    else
        status=3;
        dnt=dnt+1;
        notconnecttimes=notconnecttimes+1;
        XY(p,:)=tempXY;
        deltaenergy=0;
        prorandom=nan;
    end

    sppaeap(i,1)=status;
    sppaeap(i,2)=p;
    sppaeap(i,3)=pace;
    sppaeap(i,4)=angle;
    sppaeap(i,5)=totenergy;
    sppaeap(i,6)=deltaenergy;
    sppaeap(i,7)=prorandom;
    sppaeap(i,8)=pace_am;

    if(rem(i,recN)==0)
        ra=dat/(dat+drt+dnt);

        disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),...
            ' dat=',num2str(dat),' drt=',num2str(drt),' dnt=',num2str(dnt),...
            ' ra=',num2str(ra),' pace_am=',num2str(pace_am),' totenergy=',num2str(totenergy)]);

        if(ra>aru)
            pace_am=min(pace_am*1.01,maxpace);
            %             pace_am=pace_am*1.01;
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
        save(cellareafile,'recA','-ascii','-append');
        save(cellperimeterfile,'recP','-ascii','-append');
        save(cellenergyfile,'recE','-ascii','-append');
        save(unitposifile,'recXY','-ascii','-append');
        save(cellcenterposifile,'recCePo','-ascii','-append');
        rcpA=[status,pArea'];
        rcpP=[status,pPerimeter'];
        save(unitareafile,'rcpA','-ascii','-append');
        save(unitperimeterfile,'rcpP','-ascii','-append');
    end
end
save(checklinefile,'sppaeap');
disp('Successfully finished!');
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes),' notconnecttimes=',num2str(notconnecttimes)]);
clearvars -except foldername t00;
