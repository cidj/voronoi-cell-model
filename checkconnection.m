function [ bo ] = checkconnection( i,unitnm,vb )
%CHECKCONNECTION Summary of this function goes here
%   Detailed explanation goes here
bo=1;
for j=1:unitnm,
    n=cell2unit(i,j,unitnm);
    if(j>1)
        x = neiborcp( n-1,n,vb );
        bo=bo&&x;
    end
end
end

