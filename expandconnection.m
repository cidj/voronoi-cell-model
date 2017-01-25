function [ resultcell ] = expandconnection( startarry,totarry, vb,vb_n,dotnm )
%EXPANDCONNECTION Summary of this function goes here
%   Detailed explanation goes here

len=length(startarry);
resultcell=cell(len,1);
lentt=length(totarry);

for j=1:len,
    for k=1:lentt,
        if(startarry(j)~=totarry(k))
            if(neiborcpbc9( startarry(j),totarry(k),vb,vb_n,dotnm ))
                resultcell{j}=[resultcell{j};totarry(k)];
            end
        end
    end
end

end

