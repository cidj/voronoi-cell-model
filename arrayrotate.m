function [ brr ] = arrayrotate( k,n,arr )
%ARRAYROTATE Summary of this function goes here
%   Detailed explanation goes here

la=length(arr);
assert(k>=1&&k<=la);
brr=zeros(1,n);
for i=1:n,
    brr(i)=arr(peris(k+i-1,la));
end
end

