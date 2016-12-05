function [ bo ] = squaresect( x1q,x2q,y1q,y2q,x1,y1,x2,y2 )
%SAMESIDE Summary of this function goes here
%   Detailed explanation goes here
if (inregion(x1,y1,x1q,x2q,y1q,y2q)||inregion(x2,y2,x1q,x2q,y1q,y2q))
    bo=1;
    return;
end

e1=[x1q,y1q,x2q,y1q];
e2=[x2q,y1q,x2q,y2q];
e3=[x2q,y2q,x1q,y2q];
e4=[x1q,y2q,x1q,y1q];
eq=[e1;e2;e3;e4];
ee=[x1,y1,x2,y2];

for i=1:4,
    out=lineSegmentIntersect(eq(i,:),ee);
    bo=out.intAdjacencyMatrix;
    if (bo==1)
        break;
    end
end

end

