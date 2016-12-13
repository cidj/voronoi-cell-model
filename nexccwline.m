function [ angmax,posmax,angmin,posmin ] = nexccwline( pp,n,theta )
%NEXCCWLINE Summary of this function goes here
%   Detailed explanation goes here
len=length(pp);
x0=pp(n,1);
y0=pp(n,2);
x1=pp(peris(n+1,len),1);
y1=pp(peris(n+1,len),2);
ang=angleregion(theta,x0,y0,x1,y1);
angmax=ang;
angmin=ang;
posmax=peris(n+1,len);
posmin=peris(n+1,len);
for i=n+2:n+len-1,
    ii=peris(i,len);
    xi=pp(ii,1);
    yi=pp(ii,2);
    angle=angleregion(theta,x0,y0,xi,yi);
    if(angle>angmax)
        angmax=angle;
        posmax=ii;
    elseif(angle<angmin)
        angmin=angle;
        posmin=ii;
    else
    end
end
angmax=angmax-theta;
angmin=angmin-theta;
end

