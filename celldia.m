function [bo] = celldia( pp,la,lb )
%ASPECTRATIO Summary of this function goes here
%   Detailed explanation goes here
bo=0;
maxx=max(pp(:,1))-min(pp(:,1));
mayy=max(pp(:,2))-min(pp(:,2));

if(maxx>=la||mayy>=lb)
    bo=1;
end

end

