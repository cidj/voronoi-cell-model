function [ ij ] = single2double( n, cellv )
%SINGLE2DOUBLE Summary of this function goes here
%   Detailed explanation goes here
ij=[rem(n,cellv),floor(n/cellv)+1];
end

