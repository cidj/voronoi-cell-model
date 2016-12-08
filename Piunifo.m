function [ P ] = Piunifo( i,unitnm,polyedgelen,va,vb )
%PIUNI Summary of this function goes here
%   Detailed explanation goes here
P=0;
for j=1:unitnm,
    nj=cell2unit(i,j,unitnm);
    P=P+polyedgelen(nj);
    for k=j+1:unitnm,
        nk=cell2unit(i,k,unitnm);
        %         disp(n-1);
        %         disp(n);
        [ x,pn,~ ] = neiborcp( nj,nk,vb );
        %         disp(pn(1));
        %         disp(pn(2));
        if(x)
            z=distance(pn(1),pn(2),va);          
            %disp(z);
            P=P-2*z;
        end
    end
end
end