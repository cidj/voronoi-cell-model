function [ out ] = reducepe( n,pe)
%REDUCEPE Summary of this function goes here
%   Detailed explanation goes here
out=rem(n,pe);
if(out==0),
    out=pe;
end

end

