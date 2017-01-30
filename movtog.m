function [ Bx,vec ] = movtog( Ax,Bx,L )
%MOVTOG Summary of this function goes here
%   Detailed explanation goes here
vec=0;
while (Bx<Ax-L/2)
    Bx=Bx+L;
    vec=vec+L;
end
while(Bx>=Ax+L/2)
    Bx=Bx-L;
    vec=vec-L;
end

end

