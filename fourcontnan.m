function [ bo ] = fourcontnan( fourcells )
%FOURCONTNAN Summary of this function goes here
%   Detailed explanation goes here
bo=0;
c1=fourcells(1);
c2=fourcells(2);
c3=fourcells(3);
c4=fourcells(4);
if(isnan(c1)||isnan(c2)||isnan(c3)||isnan(c4))
    bo=1;
end

end

