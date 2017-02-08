function [ fd ] = findthecells( pothers,thenvb )
%FINDTHECELL Summary of this function goes here
%   Detailed explanation goes here

fd=[];
for i=1:length(thenvb),
    if(all(ismember(pothers,thenvb{i})))
        fd=[fd,i];
    end
end

end

