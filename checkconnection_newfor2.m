function [ x ] = checkconnection_newfor2( i,vb,vb_n,dotnm )
%CHECKCONNECTION Summary of this function goes here
%   Detailed explanation goes here

n1=cell2unit(i,1,2);
n2=cell2unit(i,2,2);

x=neiborcpbc9( n1,n2,vb,vb_n,dotnm );

% x = neiborcp( n1,n2,vb );
% if(not(x)),
%     x=check9( n1,n2,dotnm,vb_n );
% end
end
