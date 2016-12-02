function [ XY,CePo,pArea,pPerimeter,As,Ps,Es,totenergy,...
    dat,drt,dnt,accepttimes,rejectedtimes,notconnecttimes,sppa] ...
    = simustep( dotnm,unitnm,lengtha,lengthb,pace_am,...
    sp,a1,a2,a3,A0,...
    XY,CePo,pArea,pPerimeter,As,Ps,Es,totenergy,...
    dat,drt,dnt,accepttimes,rejectedtimes,notconnecttimes)
%SIMUSTEP Summary of this function goes here
%   Detailed explanation goes here
beta=2.414324e20;
cellnm=dotnm/unitnm;
p=floor(rand(1)*dotnm)+1;
angle=rand(1)*2*pi;
pace=rand(1)*pace_am;
tempXY=XY(p,:);
XY(p,:)=move(XY(p,1),XY(p,2),angle,pace);
XY_ext=ext9(lengtha,lengthb,XY);
[va_n,vb_next]=voronoin(XY_ext);
vb_n=dex9(vb_next,dotnm);
deltaenergy=0;
prorandom=0;
if(checkallconnections_new2( unitnm,vb_n,vb_next,dotnm ))
    [ pArea_n, pPerimeter_n ] = AreaandPerimeter( va_n,vb_n,dotnm );
    Ast=cellarea( cellnm,unitnm, pArea_n );
    Pst=celledgefor3( cellnm,unitnm, pPerimeter_n,va_n,vb_n);
    Est=cellener(sp,a1,a2,a3,A0,Pst,Ast);
    newtotenergy=sum(Est);
    deltaenergy=newtotenergy-totenergy;
    acc=min(1,exp(-beta*deltaenergy));
    prorandom=rand(1);
    if(prorandom<acc)
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
    dnt=dnt+1;
    notconnecttimes=notconnecttimes+1;
    XY(p,:)=tempXY;
end

sppa(1)=status;
sppa(2)=p;
sppa(3)=pace;
sppa(4)=angle;
sppa(5)=totenergy*beta;
sppa(6)=deltaenergy*beta;
sppa(7)=exp(-beta*deltaenergy);
sppa(8)=prorandom;
sppa(9)=dat;
sppa(10)=drt;
sppa(11)=dnt;
sppa(12)=pace_am;

end

