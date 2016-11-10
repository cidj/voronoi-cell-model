function [ b,ii,jj ] = checkequal( A,B )
%CHECKEQUAL Summary of this function goes here
%   Detailed explanation goes here
b=1;
ii=0;
jj=0;
if(size(A,1)~=size(B,1)||size(A,2)~=size(B,2))
    b=0;
end
for i=1:size(A,1),
    for j=1:size(A,2),
      x=(A(i,j)==B(i,j));
      b=b&&x;
      if(not(x))
          ii=i;
          jj=j;
          return
      end
    end
end
end

