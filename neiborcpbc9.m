function [ x,nei,pn,ij ] = neiborcpbc9( n1,n2,vb,vb_n,dotnm )
%NEIBORCPBC9 Summary of this function goes here
%   Detailed explanation goes here
% disp(['n1=',num2str(n1),' n2=',num2str(n2)]);
[x,pn,ij] = neiborcp( n1,n2,vb );
if(x),
    nei=vb{n2};
    %     disp(['before: nei=',num2str(nei),' x=',num2str(x)]);
else
    [x,nei,pn,ij1 ]=check9( n1,n2,dotnm,vb_n );
    %     disp(['after: nei=',num2str(nei),' x=',num2str(x)]);
    if(x),
        [x2,~,~,ij2]=check9( n2,n1,dotnm,vb_n );
        if(x==x2)
            ij=[ij1(1),ij2(1)];
        else
            disp('neiborcpbc9 error!');
        end       
    end   
end

% x = neiborcp( n1,n2,vb );
% if(not(x)),
%     x=check9( n1,n2,dotnm,vb_n );
% end
end

