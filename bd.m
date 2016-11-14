function [ BB ] = bd( xl,xr,yu,yd,hln,vln)
%BD Summary of this function goes here
%   Detailed explanation goes here
hl=(xr-xl)/hln;
vl=(yu-yd)/vln;
bdn=2*(hln+vln);
BB=zeros(bdn,2);

for i=1:bdn,
    if(i<=vln)
    BB(i,1)=xl;
    BB(i,2)=yd+(i-1)*vl;
    elseif(i<=vln+hln)
        BB(i,1)=xl+(i-vln-1)*hl;
        BB(i,2)=yu;
    elseif(i<=2*vln+hln)
        BB(i,1)=xr;
        BB(i,2)=yu-(i-vln-hln-1)*vl;
    else
       BB(i,1)=xr-(i-2*vln-hln-1)*hl;
       BB(i,2)=yd;
    end
end
%plot(BB(:,1),BB(:,2),'o');
end

