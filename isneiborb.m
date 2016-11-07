function [ is ] = isneiborb( vva, vvb)
%ISNEIBORB Summary of this function goes here
%   Detailed explanation goes here
edg=neiborbp( vva, vvb );
if(isequal(edg,[0,0]))
    is=0;
    return;
else
    is=1;
    return
end
end

