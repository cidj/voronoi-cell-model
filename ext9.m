function [ XY_ext ] = ext9( lengtha,lengthb,XY )
%EXT9 Summary of this function goes here
%   Detailed explanation goes here
dotnm=size(XY,1);
XY_ext=zeros(dotnm*9,2);
lc=1;
for xc=-1:1
    for yc=-1:1
        i1=1+(lc-1)*dotnm;
        i2=lc*dotnm;
        r00=[xc*lengtha,  yc*lengthb];
        XY_ext(i1:i2,1)=XY(:,1)+r00(1);
        XY_ext(i1:i2,2)=XY(:,2)+r00(2);      
        lc=lc+1;     
    end
end

end

