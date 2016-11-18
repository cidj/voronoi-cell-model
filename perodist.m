function [ di ] = perodist( dist,len )
%PERODIST Summary of this function goes here
%   Detailed explanation goes here
di=dist-len*round(dist/len);

end

