function [ res ] = pospor( arr )
%POSPOR Summary of this function goes here
%   Detailed explanation goes here
res=length(find(arr>0))/length(arr);
res=2*res-1;
end

