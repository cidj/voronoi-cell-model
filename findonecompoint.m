function [yn, i,j ] = findonecompoint( va,vb )
%FINDONECOMPOINT Summary of this function goes here
%   Detailed explanation goes here
la=length(va);
lb=length(vb);
for i=1:la,
    for j=1:lb,
        if (va(i)==vb(j))
            yn=1;
            return;
        end
    end
end
i=0;
j=0;
yn=0;
end

