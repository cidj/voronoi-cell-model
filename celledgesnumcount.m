function [ count ] = celledgesnumcount( edgesnumber )
%CELLEDGESNUMCOUNT Summary of this function goes here
%   Detailed explanation goes here
len=size(edgesnumber,1);
count=zeros(len,7);
bedg=[2.5:1:9.5];
for i=1:len,
    count(i,:)=histcounts(edgesnumber(i,:),bedg);
end
end

