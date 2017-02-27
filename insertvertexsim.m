function [theva0,thenvb] = insertvertexsim( n1,n2,theva0,thenvb,lengtha,lengthb)
%INSERTVERTEX Summary of this function goes here
%   Detailed explanation goes here

% n1=32;
% n2=44;

temp=movetogether(theva0(n1,:),theva0(n2,:),lengtha,lengthb);
newvertex=0.5*(theva0(n1,:)+temp);
newvertex=fallsquare(newvertex,0,lengtha,0,lengthb );

theva0=[theva0;newvertex];
newn=size(theva0,1);

fd=findthecells([n1,n2],thenvb);

for i=1:length(fd),
    bo=joinsvertex([n1,newn,n2],thenvb{fd(i)});
    if(isempty(bo)),
        disp('insertvertexsim error');
    else
        thenvb{fd(i)}=bo;
        disp(newn);
    end
end
    
end

