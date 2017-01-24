function [ thevec ] = cell2vec( thecell )
%CELL2VEC Summary of this function goes here
%   Detailed explanation goes here
thevec=[];
for i=1:length(thecell);
    thevec=[thevec;thecell{i}];
end
end

