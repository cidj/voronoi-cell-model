function [ bo ] = checkallconnections( unitnm,vb )
%CHECKALLCONNECTION Summary of this function goes here
%   Detailed explanation goes here
cellnm=length(vb)/unitnm;
bo=1;
for i=1:cellnm,
    x=checkconnection( i,unitnm,vb);
    bo=bo&&x;
    if(not(x))
        disp(['In function checkallconnections: ', num2str(i), 'th cell disconnected!']);
    end
end
end

