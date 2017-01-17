function [ z,nei,pn,ij ] = check9( n1,n2,dotnm,vb_n )
%CHECK9 Summary of this function goes here
%   Detailed explanation goes here
z=0;
nei=[];
pn=[];
ij=[];
n1p=4*dotnm+n1;
for ii=0:8,
    if(ii~=4)
        n2p=ii*dotnm+n2;
        [ z,pn,ij ]=neiborcp(n1p,n2p,vb_n);     
        if(z)   
            nei=vb_n{n2p};
%             disp(['check9: nei=',num2str(nei)]);
            return;
        end
    end
end
end

