function [ bo ] = circleconnected( ces,unitnm,va,vb,vb_n,dotnm,la,lb  )
%CIRCLECONNECTED Summary of this function goes here
%   Detailed explanation goes here
bo=1;
len=length(ces);
for i=1:len,
x = istwocellconnect( ces(i),ces(peris(i+1,len)),unitnm,va,vb,vb_n,dotnm,la,lb );
bo=bo&&x;
end
end

