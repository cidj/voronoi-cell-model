function [YX1,YX2] = makecloser(XY1,XY2,ra)
%MAKECLOSER Summary of this function goes here
%   Detailed explanation goes here
YX1=zeros(1,2);
YX2=zeros(1,2);
rb=(1-ra)/2;
lm1=rb/(1-rb);
lm2=1/lm1;
x1=XY1(1);
y1=XY1(2);
x2=XY2(1);
y2=XY2(2);
xx1=(x1+lm1*x2)/(1+lm1);
yy1=(y1+lm1*y2)/(1+lm1);
xx2=(x1+lm2*x2)/(1+lm2);
yy2=(y1+lm2*y2)/(1+lm2);
YX1(1)=xx1;
YX1(2)=yy1;
YX2(1)=xx2;
YX2(2)=yy2;
end

