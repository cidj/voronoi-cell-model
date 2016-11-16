function [ s ] = checkconnection_new3( i,unitnm,vb,vb_n,dotnm )
%CHECKCONNECTION_NEW3 Summary of this function goes here
%   Detailed explanation goes here
s=0;
y=0;
limit=2;
n1=cell2unit(i,1,unitnm);
nn=cell2unit(i,unitnm,unitnm);
for j=n1:nn,
    for k=n1+1:nn,
        x=neiborcp(j,k,vb);
        if(not(x))
            x=check9(j,k,dotnm,vb_n);
        end
        y=y+x;
    end
end
if(y>=limit)
    s=1;
end

end

