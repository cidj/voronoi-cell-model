function [ vb_new ] = dealwithvb(unitnm,vb,vb_ext )
%DEALWITHVB Summary of this function goes here
%   Detailed explanation goes here
dotnm=length(vb);
vb_new=vb;
cellnm=dotnm/unitnm;
for i=1:cellnm,
    n1=cell2unit(i,1,unitnm);
    for j=2:unitnm,
        nj=cell2unit(i,j,unitnm);
        [ x,nei ] = neiborcpbc9( n1,nj,vb,vb_ext,dotnm );
        if(x),
            vb_new{nj}=nei;
        end
    end
end
end

