function [ B ] = loadlast( filename,con )
%LOADLAST Summary of this function goes here
%   Detailed explanation goes here
A=load(filename);
A(:,1)=[];
B=A(end-con+1:end,:)';
end

