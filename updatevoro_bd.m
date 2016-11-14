function [va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro_bd(XY, celllattx,celllatty,cellh,cellv )
%UPDATEVORO_BD Summary of this function goes here
%   Detailed explanation goes here
    dotnm=length(XY);
    XY_bd=abd( XY, celllattx,celllatty,celllattx*cellh,celllatty*cellv,cellh,cellv );  
    dotbdnm=length(XY_bd);
    [ va,vb,polyarea,polyedgelen,polyneibor ] = updatevoro( XY_bd );
    vb(dotnm+1:dotbdnm,:)=[];
    polyarea(dotnm+1:dotbdnm,:)=[];
    polyedgelen(dotnm+1:dotbdnm,:)=[];
    polyneibor(dotnm+1:dotbdnm,:)=[];
end

