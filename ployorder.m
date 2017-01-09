function [ ccw ] = ployorder( p )
%PLOYORDER Summary of this function goes here
%   Detailed explanation goes here
n=length(p);
pos=0;
neg=0;
for i=1:n    
    j=peris(i-1,n);
    k=peris(i+1,n);  
    v1=p(peris(j,n),:)-p(i,:);
    v2=p(peris(k,n),:)-p(i,:);
    r=det([v1;v2]); 
    if r>0
        pos=pos+1;    
    elseif r<0
        neg=neg+1; 
    else
    end

end
    ccw=(pos>neg);
end

