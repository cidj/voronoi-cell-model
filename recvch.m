function [ bo ] = recvch( NN,dotnm,vb,vb_n )
%RECVCH Summary of this function goes here
%   Detailed explanation goes here
le=length(NN);
if(le==1)
    bo=1;
else
    bo=isunitconnected(NN(1),NN(2:end),dotnm,vb,vb_n)&&recvch(NN(2:end),dotnm,vb,vb_n ); 
end
end

