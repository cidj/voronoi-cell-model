function [x,pn,ij ] = newneiborbp( vva, vvb )
%NEIBORBP Summary of this function goes here
%   Detailed explanation goes here

%x gives whether the two unit are neibors.
%pn gives the index of the two vertex of the common edge.
%ij gives the index of the common edge in the two units.

a=length(vva);
b=length(vvb);
x=0;
pn=[];
ij=[];
for i=1:a,
    for j=1:b,
        if (vva(i)==vvb(j))
            if(vva(peris(i+1,a))==vvb(peris(j+1,b)))
                x=1;
                ij=[i,j];
                pn=[vva(i),vva(peris(i+1,a))];
            elseif(vva(peris(i+1,a))==vvb(peris(j-1,b)))
                x=1;
                ij=[i,peris(j-1,b)];
                pn=[vva(i),vva(peris(i+1,a))];
            end
        end
    end
end
end

