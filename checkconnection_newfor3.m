function [ s ] = checkconnection_newfor3( i,vb,vb_n,dotnm )
%CHECKCONNECTION Summary of this function goes here
%   Detailed explanation goes here

n1=cell2unit(i,1,3);
n2=cell2unit(i,2,3);
n3=cell2unit(i,3,3);

s0=neiborcpbc9( n1,n2,vb,vb_n,dotnm );
s0=s0+neiborcpbc9( n2,n3,vb,vb_n,dotnm );

if(s0>1)
    s=1;
else
    s0=s0+neiborcpbc9( n3,n1,vb,vb_n,dotnm );
    
    if(s0>1)
        s=1;
    else
        s=0;
    end
end
end