function [ bo,xx,yy ] = checkdistancetest( A,B,la,lb )
%CHECKDISTANCE Summary of this function goes here
%   Detailed explanation goes here

bo=0;
xx=abs(A(1)-B(1));
yy=abs(A(2)-B(2));
if(xx>=la||yy>=lb)
    bo=1;
end

end

