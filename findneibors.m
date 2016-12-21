function [ nelist ] = findneibors(t, cn, ceineibodet )
%FINDNEIBORS Summary of this function goes here
%   Detailed explanation goes here

cln=length(cn);
nelist=[];
for i=1:cln,
    nnei=cn(i);
    nelist=union(nelist,ceineibodet{t,nnei});
end
% nelist=setdiff(nelist,cn);
end

