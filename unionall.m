function [ unioned ] = unionall(varargin  )
%UNIONALL Summary of this function goes here
%   Detailed explanation goes here
unioned=[];
for i=1:nargin,
    unioned=union(unioned,inputname(i));
end   

end

