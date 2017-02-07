function [ bo ] = checkdistance( A,B,la,lb )
%CHECKDISTANCE Summary of this function goes here
%   Detailed explanation goes here

bo=0;
if(abs(A(1)-B(1))>=la||abs(A(2)-B(2))>=lb)
    bo=1;
end

end

