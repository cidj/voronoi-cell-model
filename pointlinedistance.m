function [ d ] = pointlinedistance( P,Q1,Q2 )
%POINTLINEDISTANCE Summary of this function goes here
%   Detailed explanation goes here

% if(isequal(Q1,Q2))
%     d=NaN;
    
d=abs(det([Q2-Q1;P-Q1]))/norm(Q2-Q1);


end

