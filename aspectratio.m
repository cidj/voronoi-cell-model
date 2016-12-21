function [ ratio,mainaxisangle,maxdis,poma,mindis,pomb1,pomb2 ] = aspectratio( pp )
%ASPECTRATIO Summary of this function goes here
%   Detailed explanation goes here
len=length(pp);

%find the maximum distance
dis2=0;
for i=1:len,
    for j=i+1:len,
        dd=(pp(j,1)-pp(i,1))^2+(pp(j,2)-pp(i,2))^2;
        if(dd> dis2)
            dis2=dd;
            poma=[i,j];
        end
    end
end
maxdis=sqrt(dis2);

% mainaxisangle=angleregion(0,pp(poma(1),1),pp(poma(1),2),pp(poma(2),1),pp(poma(2),2));
mainaxisangle=atan2d(pp(poma(2),2)-pp(poma(1),2),pp(poma(2),1)-pp(poma(1),1));

%find the minimum distance
[~,xyipos]=min(pp,[],1);
[~,xyapos]=max(pp,[],1);
pos1=xyipos(1);
pomb1=[pos1,0];
pos2=xyapos(1);
pomb2=[pos2,0];
xi1=pp(pos1,1);
yi1=pp(pos1,2);
xi2=pp(pos2,1);
yi2=pp(pos2,2);
mindis=xi2-xi1;
ang0min1=-90;
ang0min2=90;
[ ~,~,angmin1,posmin1 ] = nexccwline( pp,pos1,ang0min1);
[ ~,~,angmin2,posmin2 ] = nexccwline( pp,pos2,ang0min2);
i=1;
while(1)
    if(angmin1<angmin2)
        xj1=pp(posmin1,1);
        yj1=pp(posmin1,2);
        kk=(yj1-yi1)/(xj1-xi1);
        di=linedist( xi1,yi1,xi2,yi2,kk );
        if(di<=mindis)
            mindis=di;
            pomb1=[pos1,posmin1];
            pomb2=[pos2,0];
        end
        ang0min1=angleregion(0,xi1,yi1,xj1,yj1);
        ang0min2=ang0min1+180;
        pos1=posmin1;
        xi1=xj1;
        yi1=yj1;
    else
        xj2=pp(posmin2,1);
        yj2=pp(posmin2,2);
        kk=(yj2-yi2)/(xj2-xi2);
        di=linedist(xi1,yi1,xi2,yi2,kk);
        if(di<=mindis)
            mindis=di;
            pomb1=[pos1,0];
            pomb2=[pos2,posmin2];
        end
        ang0min2=angleregion(0,xi2,yi2,xj2,yj2);
        ang0min1=ang0min2+180;
        pos2=posmin2;
        xi2=xj2;
        yi2=yj2;
    end
    [ ~,~,angmin1,posmin1 ] = nexccwline( pp,pos1,ang0min1);
    [ ~,~,angmin2,posmin2 ] = nexccwline( pp,pos2,ang0min2);
    i=i+1;
%     disp(['pos1=',num2str(pos1), ' pos2=',num2str(pos2)]);
    if(pos1==xyapos(1)&&pos2==xyipos(1))
        ratio=mindis/maxdis;
        break;
    end
    if(i>2*len)
        disp('Rotating paralell lines error!');
        ratio=nan;
        break;
    end     
end
end

