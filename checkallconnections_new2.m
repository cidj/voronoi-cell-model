function [ bo ] = checkallconnections_new2( unitnm,vb,vb_n,dotnm )
%CHECKALLCONNECTION Summary of this function goes here
%   Detailed explanation goes here
cellnm=length(vb)/unitnm;
bo=1;
for i=1:cellnm,
%     x=checkconnection_new( i,unitnm,vb,vb_n,dotnm)||checkconnection_new2( i,unitnm,vb,vb_n,dotnm);
    x=checkconnection_newfor3( i,unitnm,vb,vb_n,dotnm);
    bo=bo&&x;
%     if(not(x))
%         disp(['In function checkallconnections_new2: ', num2str(i), 'th cell disconnected!']);
%     end
end
end

