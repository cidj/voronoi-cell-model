function [ x,pn,ij ] = neiborcp( n1,n2,vb )
%NEIBORCP Summary of this function goes here
%   Detailed explanation goes here

[x,pn,ij]=neiborbp(vb{n1}, vb{n2});
% [x,pn,ij]=newneiborbp(vb{n1}, vb{n2});
end

