function [ did,nm,vdi,vba ] = mercheck9( vva,n,vb_n,dotnm )
%MERCHECK Summary of this function goes here
%   Detailed explanation goes here

for ii=0:8,
    if(ii~=4)
        np=ii*dotnm+n; 
        [ did,nm,vdi,vba ]=mergeunits1(vva,vb_n{np});
%         [ did,nm,~,~,vdi,vba ]=mergeunits(vva,vb_n{np});
        if(nm)   
            return;
        end
    end
end

end

