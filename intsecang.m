function [r ] = intsecang( ag1,ag0 )
%INTSECANG Summary of this function goes here
%   Detailed explanation goes here

r=abs(mod(ag1,180)-mod(ag0,180));
if(r>90),
    r=180-r;
end    

end

