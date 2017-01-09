function [ bo,len ] = istwocellconnect( cea,ceb,unitnm,va,vb,vb_n,dotnm,la,lb )
%ISTWOCELLCONNECT Summary of this function goes here
%   Detailed explanation goes here
% la=lengtha;
% lb=lengthb;
% vb=vb_n;
% vb_n=vb_next;
% cea=4;
% ceb=8;

bo=0;
len=0;
for i=1:unitnm,
    ai=cell2unit(cea,i,unitnm);
    for j=1:unitnm,
        bi=cell2unit(ceb,j,unitnm);
        [x,~,pn,~] =neiborcpbc9( ai,bi,vb,vb_n,dotnm);
        bo=bo||x;
        if(~isempty(pn))
            len=len+distanpero(va(pn(1),1),va(pn(1),2),va(pn(2),1),va(pn(2),2),la,lb);
        end
    end
end
end

