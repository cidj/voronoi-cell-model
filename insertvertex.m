function [theva0,thenvb,linklist ] = insertvertex( n1,n2,theva0,thenvb,linklist )
%INSERTVERTEX Summary of this function goes here
%   Detailed explanation goes here

% n1=32;
% n2=44;

newvertex=0.5*(theva0(n1,:)+theva0(n2,:));
theva0=[theva0;newvertex];
newn=size(theva0,1);

fd=findthecells([n1,n2],thenvb);

for i=1:length(fd),
    thenvb{fd(i)}=joinsvertex([n1,newn,n2],thenvb{fd(i)});
end
    
linklist{n1}(linklist{n1}==n2)=newn;
linklist{n2}(linklist{n2}==n1)=newn;

linklist=[linklist;[n1,n2]];

end

