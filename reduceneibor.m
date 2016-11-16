function [ newpolyneibor ] = reduceneibor( polyneibor, dotnm )
%REDUCENEIBOR Summary of this function goes here
%   Detailed explanation goes here
len=length(polyneibor);
newpolyneibor=cell(len,1);
for i=1:len,
    leni=length(polyneibor{i});
    for j=1:leni,
        a=rem(polyneibor{i}(j),dotnm);
        if(a~=0)
            newpolyneibor{i}(j)=a;
        else
            newpolyneibor{i}(j)=dotnm;
        end
    end
end
end

