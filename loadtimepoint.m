function [ B ] = loadtimepoint( filename,con,tp )
%LOADLAST Summary of this function goes here
%   Detailed explanation goes here
A=load(filename);
A(:,1)=[];
B=A((tp-1)*con+1:tp*con,:)';
end

