function [ n ] = double2single( i,j,cellv )
%DOUBLE2SINGLE Summary of this function goes here
%   Detailed explanation goes here
assert(i<=cellv,'Line number i does not exit!');
n=(j-1)*cellv+i;
end

