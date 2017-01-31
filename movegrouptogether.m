function [  va,vbi ] = movegrouptogether( va,vbi,lengtha,lengthb )
%MOVEGROUPTOGETHER Summary of this function goes here
%   Detailed explanation goes here

for i=2:length(vbi),
    [ va(vbi(i),:),~ ] = movetogether( va(vbi(1),:),va(vbi(i),:),lengtha,lengthb);
end
end

