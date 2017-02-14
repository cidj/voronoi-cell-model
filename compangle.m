function [ angles ] = compangle(A,O,B,la,lb)
%VERTEXPOINTS Summary of this function goes here
%   Detailed explanation goes here

    angrig=atan2d(perodist(B(2)-O(2),lb),perodist(B(1)-O(1),la));
    anglef=atan2d(perodist(A(2)-O(2),lb),perodist(A(1)-O(1),la));
    angles=abs(anglef-angrig);
    if(angles>180),
        angles=360-angles;
    end

end

