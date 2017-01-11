function [ did,nm,vdi,vba] = merge9( vva,n,vb,vb_n,dotnm )
%NEIBORCPBC9 Summary of this function goes here
%   Detailed explanation goes here

[did,nm,vdi,vba ] = mergeunits1( vva,vb{n});
% [did,nm,~,~,vdi,vba ] = mergeunits( vva,vb{n});

if(not(nm))
  [ did,nm,vdi,vba ] = mercheck9( vva,n,vb_n,dotnm );
end

end