function [ z,px,py,nx,ny ] = potentialheight2( x,y )
%POTENTIALHEIGHT Summary of this function goes here
%   Detailed explanation goes here
% tt=comed;
% ttlim=100;
% otherlim=150;
% [ xaxi,~,~,aav ] = gethist( tt,ttlim,cE1234,otherlim );
% x=xaxi;
% y=aav;
x(isnan(y))=[];
y(isnan(y))=[];

x(isinf(y))=[];
y(isinf(y))=[];
% figure;
% hold on
% plot(x,y,'o');
p=polyfit(x,y,16);
% f=polyval(p,x);
% plot(x,f,'+');
ff=@(z) polyval(p,z);
% plot(x,ff(x),'-');
[px,py]=fminbnd(ff,0,max(x));
[nx,ny]=fminbnd(ff,min(x),0);
z=ff(0);

end

