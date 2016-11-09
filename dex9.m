function [ XY ] = dex9( XY_ext,dotnm )
%XY_DEX Summary of this function goes here
%   Detailed explanation goes here
XY=XY_ext(dotnm*4+1:dotnm*5,:);
end

