clear all;
addpath([pwd,'/vorosim']);
creatparameters4;
prepareparameters4;
creatcells;
t00=clock;

% mainsimu4;
% dataanalysis4;
% dostatistics4;
% VelocityAnalysis;
% plotfigures4;
% convertfigs;
% % disp(['All set: minutes=',num2str(etime(clock,t00)/60)]);
% clear all;
% %exit;


% load(parameterfile);
% loadcells;
aarr=cell(ncycl/recN,1);
bcel=cell(ncycl/recN,1);
ic=0;
accepttimes=0;
rejectedtimes=0;
notconnecttimes=0;
aru=0.3;
ard=0.5;
minratio=0.8;
dat=0;
drt=0;
dnt=0;
ra=0;
sppaeap=zeros(ncycl,8);

[ theva0,thenvb ] = preparevertexes( lengtha,lengthb,XY);
% [ Poneibor,Poedgelen,theva0,thenvb,vb ] = unitneibors( XY,lengtha,lengthb );

t0=clock;
disp('Starting!');

for i=1:ncycl,
    p1=motcels(floor(rand(1)*length(motcels))+1);
    vertexnumber=length(thenvb{p1});
    p2=floor(rand(1)*vertexnumber)+1;
    p3=thenvb{p1}(p2);
    p4=thenvb{p1}(peris(p2+1,vertexnumber));
    %     ratio=0.5*(1+rand(1));
    ratio=minratio+(1-minratio)*rand(1);
    tempXY1=theva0(p3,:);
    tempXY2=theva0(p4,:);
    
    [theva0(p3,:),theva0(p4,:)]=makeclosermt(theva0(p3,:),theva0(p4,:),ratio,lengtha,lengthb);
    
    
    %     angle=rand(1)*2*pi;
    %     pace=rand(1)*pace_am;
    %     XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
    %     XY(p,:)=fallsquare( XY(p,:),0,lengtha,0,lengthb );
    %     XY_ext=ext9(lengtha,lengthb,XY);
    %     [va_n,vb_next]=voronoin(XY_ext);
    %     [va_n,vb_next]=voronoiDiagram(delaunayTriangulation(XY_ext));
    %     vb_n=dex9(vb_next,dotnm);
    
    
    
    if(1)
        [ pArea_n, pPerimeter_n ] = AreaandPerimeter( theva0,thenvb,dotnm,lengtha,lengthb );
        Ast=cellarea( cellnm,unitnm, pArea_n );
        Pst=celledgefo( cellnm,unitnm, pPerimeter_n,theva0,thenvb);
        Est=cellener4(sp,a1,a2,a3,A0,Pst,Ast);
        newtotenergy=sum(Est);
        %         disp(['newtotenergy=',num2str(newtotenergy),'totenergy=',num2str(totenergy)]);
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
            
        else
            status=2;
            drt=drt+1;
            rejectedtimes=rejectedtimes+1;
            theva0(p3,:)=tempXY1;
            theva0(p4,:)=tempXY2;
        end
    else
        status=3;
        dnt=dnt+1;
        notconnecttimes=notconnecttimes+1;
        theva0(p3,:)=tempXY1;
        theva0(p4,:)=tempXY2;
        deltaenergy=0;
        prorandom=nan;
    end
    
    sppaeap(i,1)=status;
    sppaeap(i,2)=p1;
    sppaeap(i,3)=p2;
    sppaeap(i,4)=ratio;
    sppaeap(i,5)=totenergy;
    sppaeap(i,6)=deltaenergy;
    sppaeap(i,7)=prorandom;
    sppaeap(i,8)=minratio;
    
    if(rem(i,recN)==0)
        ra=dat/(dat+drt+dnt);
        
        disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),...
            ' dat=',num2str(dat),' drt=',num2str(drt),' dnt=',num2str(dnt),...
            ' ra=',num2str(ra),' minratio=',num2str(minratio),' totenergy=',num2str(totenergy)]);
        
        if(ra>aru)
            minratio=minratio*0.99;
            
            %             pace_am=min(pace_am*1.01,maxpace);
            %             pace_am=pace_am*1.01;
        end
        if(ra<ard)
            minratio=min(minratio*1.01,1);
            %             pace_am=pace_am*0.99;
        end
        
        dat=0;
        drt=0;
        dnt=0;
          
        ic=ic+1;
        aarr{ic}=theva0;
        bcel(ic)={thenvb};
        
        recA=[status,As'];
        recP=[status,Ps'];
        recE=[status,Es'];
        
        save(cellareafile,'recA','-ascii','-append');
        save(cellperimeterfile,'recP','-ascii','-append');
        save(cellenergyfile,'recE','-ascii','-append');
        
        %         disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),' totenergy=',num2str(totenergy)]);
        %         disp(['prorandom=',num2str(prorandom),' acc=',num2str(acc)]);
        
    end
end
save(checklinefile,'sppaeap');
save([foldername,'/','thedataAB.mat'],'aarr','bcel');
disp('Successfully finished!');
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes),' notconnecttimes=',num2str(notconnecttimes)]);
% clearvars -except foldername t00;
