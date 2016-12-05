function [ bo ] = isunitconnected( n,N,dotnm,vb,vb_n )
%ISUNITCONNECTED Summary of this function goes here
%   Detailed explanation goes here
le=length(N);
 for i=1:le,
     bo=neiborcpbc9( n,N(i),vb,vb_n,dotnm );
     if(bo),
         return;
     end
 end
end

