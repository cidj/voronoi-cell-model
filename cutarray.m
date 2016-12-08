function [ v1,v2 ] = cutarray( k,vv )
%CUTARRAY Summary of this function goes here
%   Detailed explanation goes here

if(k<length(vv))
    v1=vv(1:k);
    v2=vv(k+1:end);
else
    v1=vv;
    v2=[];
end

end

