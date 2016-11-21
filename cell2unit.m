function [ unit ] = cell2unit( n1,n2,unitnm )
%CELL2UNIT Summary of this function goes here
%   Detailed explanation goes here
assert(n2<=unitnm,'unitnm is too large!');
unit=(n1-1)*unitnm+n2;
end

