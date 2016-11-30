clear figure
clear all
clc
clear

diary off;
diary('log1.txt');
diary on;
disp('Started!');
load('everything.mat');
accepttimes=0;
rejectedtimes=0;
notconnecttimes=0;

t0=clock;
ncycl=1000
pace_am=0.5e-10
for i=1:ncycl,
    p=floor(rand(1)*dotnm)+1;
    angle=rand(1)*2*pi;
    pace=rand(1)*pace_am;
%     pace=0.4;
    tempXY=XY(p,:);
    XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
    XY_ext=ext9(lengtha,lengthb,XY);
    [va_n,vb_next]=voronoin(XY_ext);
    vb_n=dex9(vb_next,dotnm);   
    %if(checkconnection( unit2cell( p,unitnm ),unitnm,vb_n ))
    if(checkallconnections_new2( unitnm,vb_n,vb_next,dotnm ))   
%      if(1)
        [ pArea_n, pPerimeter_n ] = AreaandPerimeter( va_n,vb_n,dotnm );
        
        Ast=cellarea( cellnm,unitnm, pArea_n );
        Pst=celledgefor3( cellnm,unitnm, pPerimeter_n,va_n,vb_n);
        newtotenergy=totener(sp,a1,a2,a3, A0, Pst, Ast);
        acc=min(1,exp(-beta*(newtotenergy-totenergy)));
        prorandom=rand(1);
%         disp(['totenergy=',num2str(totenergy),' newtotenergy=',num2str(newtotenergy),' deltaenergy=',num2str(newtotenergy-totenergy)]);
%         disp(['()=',num2str(-beta*(newtotenergy-totenergy)),' exp=',num2str(exp(-beta*(newtotenergy-totenergy)))]);
%         if(newtotenergy<totenergy)
%             disp('attention!');
%         end
        %         if(1)
%         if(prorandom<acc)
         if(log(prorandom)<min(0,-beta*(newtotenergy-totenergy)))
%          if(newtotenergy<totenergy)
            % pause;
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
    sppaeap(i,6)=newtotenergy;
    sppaeap(i,7)=newtotenergy-totenergy;
    sppaeap(i,8)=(-beta*(newtotenergy-totenergy));
    sppaeap(i,9)=acc;
    sppaeap(i,10)=log(prorandom);
    sppaeap(i,11)=dat;
    sppaeap(i,12)=drt;
    sppaeap(i,13)=ra;
    sppaeap(i,14)=pace_am;
    
    if(rem(i,recN)==0)
                      
        disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),...
            ' dat=',num2str(dat),' drt=',num2str(drt),...
            ' ra=',num2str(ra),' pace_am=',num2str(pace_am)]);
        
%         disp(['i=',num2str(i),' minutes=',num2str(etime(clock,t0)/60),...
%             ' dat=',num2str(dat),' drt=',num2str(drt),...
%             ' ra=',num2str(ra)]);

        ra=dat/(dat+drt);
        
        if(ra>aru)
            pace_am=pace_am*1.01;
        end
        if(ra<ard)
            pace_am=pace_am*0.99;
        end
        
        dat=0;
        drt=0;  
    end
end

save('everything1.mat');
disp('Successfully finished!');
disp(['accepttimes=',num2str(accepttimes),' rejectedtimes=',num2str(rejectedtimes),' notconnecttimes=',num2str(notconnecttimes)]);
diary off;








