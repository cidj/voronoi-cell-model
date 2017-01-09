function [ ll ] = fourcelledge( cells4,unitnm,va,vb,vb_n,dotnm,la,lb  )
%FOURCELLEDGE Summary of this function goes here
%   Detailed explanation goes here
[ bo,len ] = istwocellconnect( cells4(1),cells4(3),unitnm,va,vb,vb_n,dotnm,la,lb );
if(bo)
    ll=len;
    return;
end

[ bo,len ] = istwocellconnect( cells4(2),cells4(4),unitnm,va,vb,vb_n,dotnm,la,lb );

if(bo)
    ll=-len;
    return;
end
ll=nan;
end

