function [ zey,minpx,minpy,minnx,minny ] = potentialheight( x,y )
%POTENTIALHEIGHT Summary of this function goes here
%   Detailed explanation goes here
% x=xcE1234;
% y=avcE1234;
[zex,zei]=min(abs(x));
zey=y(zei);
if(zex>=0)
    xp=x(zei:end);
    xn=x(1:zei-1);
    yp=y(zei:end);
    yn=y(1:zei-1);
else
    xp=x(zei+1:end);
    xn=x(1:zei);
    yp=y(zei+1:end);
    yn=y(1:zei);
end
[minpy,minpi]=min(yp);
minpx=xp(minpi);
[minny,minni]=min(yn);
minnx=xn(minni);
% hwell=0.5*(minpy+minny);
% h=zey-hwell;
end

