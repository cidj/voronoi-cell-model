function [ sec ] = separr( arr,ind )
%SEPARR Summary of this function goes here
%   Detailed explanation goes here
% arr=[1;2;3;4;5;6;7];
% ind=[2,6];
len=length(ind);
sec=cell(len,1);
for i=1:len-1,
    sec{i}=arr(ind(i):ind(i+1)-1);
end

st=ind(1)-1;
if(st~=0)  
    sec{len}=[arr(ind(end):end);arr(1):arr(st)];
else
    sec{len}=arr(ind(end):end);
end

end

