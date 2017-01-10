function [ secj ] = arr2cells( arr,sec )
%ARR2CELLS Summary of this function goes here
%   Detailed explanation goes here
len=length(sec);
secj=cell(len,1);
for i=1:len,
    secj{i}=arr(sec{i});
end
end

