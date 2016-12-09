function [yn, x1n,x2n ] = sectionfall( x1,x2,a1,a2 )
%SECTIONFALL Summary of this function goes here
%   Detailed explanation goes here
la=a2-a1;
yn=0;
x1n=x1;
x2n=x2;
if(x1<a1||x2<a1) 
    yn=1;
    x1n=x1+la;
    x2n=x2+la;
end
if(x1>a2||x2>a2) 
    yn=1;
    x1n=x1-la;
    x2n=x2-la;
end
end

