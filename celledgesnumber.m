function [ edgesnumber ] = celledgesnumber( celledges ,minilen)
%CELLEDGESNUMBER Summary of this function goes here
%   Detailed explanation goes here
len=size(celledges,1);
cellnm=size(celledges,2);
edgesnumber=zeros(len,cellnm);
for i=1:len,
    for j=1:cellnm,
        numlen=length(celledges{i,j});
        count=0;
        for k=1:numlen,
            if(celledges{i,j}(k)>minilen)
                count=count+1;
            end
        end
        edgesnumber(i,j)=count;
    end
end
            

end

