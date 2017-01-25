function [ bo ] = checkallconnectionsu123( unitnm,vb,vb_n,dotnm )
%CHECKALLCONNECTION Summary of this function goes here
%   Detailed explanation goes here
cellnm=length(vb)/unitnm;
bo=1;
if(unitnm==1)
elseif(unitnm==2)
    for i=1:cellnm,
        x=checkconnection_newfor2( i,vb,vb_n,dotnm);
        bo=bo&&x;
    end
elseif(unitnm==3)
    for i=1:cellnm,
        x=checkconnection_newfor3( i,vb,vb_n,dotnm);
        bo=bo&&x;
    end
elseif(unitnm==4)
    for i=1:cellnm,
        x=checkconnection_newfor4( i,vb,vb_n,dotnm);
        bo=bo&&x;
    end
else
    for i=1:cellnm,
        x=checkconnection_newforn( i,vb,vb_n,dotnm,unitnm);
        bo=bo&&x;
    end
    %     disp('unitnm error!');
end

end

