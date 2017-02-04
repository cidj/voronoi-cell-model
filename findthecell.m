function [ fd ] = findthecell( pothers,thenvb )
%FINDTHECELL Summary of this function goes here
%   Detailed explanation goes here

for i=1:length(thenvb),
    if(all(ismember(pothers,thenvb{i})))
        fd=i;
        return;
    end
end
fd=0;


end

