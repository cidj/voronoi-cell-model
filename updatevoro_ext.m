function [va,vb,polyarea,polyedgelen,polyneibor] = updatevoro_ext( lengtha,lengthb,XY )
%UPDATEVORO_EXT Summary of this function goes here
%   Detailed explanation goes here
    dotnm=length(XY);
    XY_ext=ext9(lengtha,lengthb,XY);
    [ va,vb1,polyarea1,polyedgelen1,polyneibor1 ] = updatevoro( XY_ext );
    vb=dex9(vb1,dotnm);
    polyarea=dex9(polyarea1,dotnm);
    polyedgelen=dex9(polyedgelen1,dotnm);
    polyneibor=reduceneibor(dex9(polyneibor1,dotnm),dotnm);    
end

