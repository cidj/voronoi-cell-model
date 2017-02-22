function [ linklist ] = getlinklist( theva0,thenvb )
%GETEDGELIST Summary of this function goes here
%   Detailed explanation goes here

linklist=cell(length(theva0),1);
for i=1:length(thenvb),
    thenvbi=thenvb{i};
    len=length(thenvbi);
    for j=1:len,
        linklist{thenvbi(j)}=[linklist{thenvbi(j)},thenvbi(peris(j-1,len)),thenvbi(peris(j+1,len))];
    end
end
for i=1:length(linklist),
    linklist{i}=unique(linklist{i});
end
        

end

