function [ thevec ] = cell2vec2d( thecell )
%CELL2VEC Summary of this function goes here
%   Detailed explanation goes here
thevec=[];
[ilen,jlen]=size(thecell);
for i=1:ilen,
    for j=1:jlen,
        thevec=[thevec,thecell{i,j}];
    end
end
end

