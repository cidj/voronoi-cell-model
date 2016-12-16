function [ brr ] = secarr( arr,a,b )
%SECARR Summary of this function goes here
%   Detailed explanation goes here
if(a<b)
    brr=arr(a:b);
else
    brr=[arr(a:end),arr(1:b)];
end
end

