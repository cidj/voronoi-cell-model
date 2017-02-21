function [ cs ] = findncneighbors( n1,c1,thenvb )
%FINDNCNEIGHBORS Summary of this function goes here
%   Detailed explanation goes here
pos=find(thenvb{c1}==n1);
lpos=length(thenvb{c1});
posf=peris(pos-1,lpos);
posr=peris(pos+1,lpos);
vpos=thenvb{c1}(pos);
vposf=thenvb{c1}(posf);
vposr=thenvb{c1}(posr);
cf=setdiff(findthecells([vpos,vposf],thenvb),c1);
cr=setdiff(findthecells([vpos,vposr],thenvb),c1);
cs=[cf,cr];

end

