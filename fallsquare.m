function [ B ] = fallsquare( A,lx1,lx2,ly1,ly2 )
%FALLSQUARE Summary of this function goes here
%   Detailed explanation goes here
len=size(A,1);
B=zeros(len,2);
for i=1:len,
    if(isfinite(A(i,1)))
        B(i,1)=fall(A(i,1),lx1,lx2);
        B(i,2)=fall(A(i,2),ly1,ly2);
    end
end
end

