function [ cell,unit ] = unit2cell( n,unitnm )
%UNIT2CELL Summary of this function goes here
%   Detailed explanation goes here
cell=floor((n-1)/unitnm)+1;
unit=rem(n-1,unitnm)+1;
end

