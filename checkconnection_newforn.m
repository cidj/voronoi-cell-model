function [ x ] = checkconnection_newforn( i,vb,vb_n,dotnm,unitnm)
%CHECKCONNECTION_NEWFORN Summary of this function goes here
%   Detailed explanation goes here

% vb=vb_n;
% vb_n=vb_next;
% i=10;


nsarray=zeros(unitnm,1);
for j=1:unitnm,
    nsarray(j)=cell2unit(i,j,unitnm);
end
target=nsarray(1);
uarray=nsarray(1);
while 1
    
resultcell=expandconnection( target,nsarray,vb,vb_n,dotnm );
thevec=unique(cell2vec(resultcell));
target=setdiff(thevec,uarray);
uarray=union(thevec,uarray);

cond1=isempty(setdiff(nsarray,uarray));
cond2=isempty(target);

if(cond1)
    x=1;
    return
else
    if(cond2)
        x=0;
        return
    end
end

end

end

