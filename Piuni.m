function [ P ] = Piuni( i,unitnm,polyedgelen,va,vb )
%PIUNI Summary of this function goes here
%   Detailed explanation goes here
P=0;
for j=1:unitnm,
    n=cell2unit(i,j,unitnm);
    P=P+polyedgelen(n);
    if(j>1)
%         disp(n-1);
%         disp(n);
        [ ~,pn,ij ] = neiborcp( n-1,n,vb );
%         disp(pn(1));
%         disp(pn(2));
        z=distance(pn(1),pn(2),va);

        %disp(z);
        P=P-2*z;
    end
end
end


