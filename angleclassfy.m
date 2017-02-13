function [ thediff ] = angleclassfy(vtangc,nvtangc)
%VERTEXPOINTS Summary of this function goes here
%   Detailed explanation goes here
len=length(vtangc);
thediff=cell(len,1);
for i=1:len,
%     disp(i);
    thediff{i}=finddif(vtangc{i},nvtangc{i});
end
end

