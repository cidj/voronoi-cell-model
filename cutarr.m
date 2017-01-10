function [ brr ] = cutarr( a,b,arr, sign)
%CUTARR Summary of this function goes here
%   Detailed explanation goes here
la=length(arr);
assert(a>=1&&a<=la);
assert(b>=1&&b<=la);

if(sign<0)
    a=la-a+1;
    b=la-b+1;
    arr=flip(arr);
end
len=peris(b-a,la);
brr=arrayrotate(a,len,arr);
end

