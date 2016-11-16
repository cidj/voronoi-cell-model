function [ bo ] = checkconnection_new2( i,unitnm,vb,vb_n,dotnm )
%CHECKCONNECTION Summary of this function goes here
%   Detailed explanation goes here
bo=1;

n1=cell2unit(i,1,unitnm);
nn=n1+unitnm-1;

x = neiborcp( n1,nn,vb );
if(not(x))
    n1p=4*dotnm+n1;
    for ii=0:8,
        if(ii~=4)
            nnp=ii*dotnm+nn;
            z=neiborcp(n1p,nnp,vb_n);
            if(z)
                x=z;
                break;
            end
        end
    end
end
bo=bo&&x;

end
