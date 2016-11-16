function [ bo ] = checkconnection_new( i,unitnm,vb,vb_n,dotnm )
%CHECKCONNECTION Summary of this function goes here
%   Detailed explanation goes here
bo=1;
for j=1:unitnm,
    n=cell2unit(i,j,unitnm);
    if(j>1)
        x = neiborcp( n-1,n,vb );
        if(not(x))
            
            x=check9( n-1,n,dotnm,vb_n );
%             np_1=4*dotnm+n-1;
%             for ii=0:8,
%                 if(ii~=4)
%                     np=ii*dotnm+n;
%                     z=neiborcp(np_1,np,vb_n);
%                     if(z)
%                         x=z;
%                         break;
%                     end
%                 end
%             end
        end
        bo=bo&&x;
    end
end
end


%old version
%
% bo=1;
% for j=1:unitnm,
%     n=cell2unit(i,j,unitnm);
%     if(j>1)
%         x = neiborcp( n-1,n,vb );
%         if(not(x))
%             np_1=4*dotnm+n-1;
%             for ii=0:8,
%                 if(ii~=4)
%                     np=ii*dotnm+n;
%                     z=neiborcp(np_1,np,vb_n);
%                     if(z)
%                         x=z;
%                         break;
%                     end
%                 end
%             end
%         end
%         bo=bo&&x;
%     end
% end

%new version half done

% bo=1;
% 
% n0=cell2unit(i,1,unitnm)-1;
% 
% for j=n0+1:n0+unitnm,
%     for k=j+1:n0+unitnm,
%         x=neiborcp(j,k,vb);
%         if(not(x))
%             jp=4*dotnm+j;
%             for ii=0:8,
%                 if(ii~=4)
%                     kp=ii*dotnm+k;
%                     z=neiborcp(jp,kp,vb_n);
%                     if(z)
%                         x=z;
%                         break;
%                     end
%                 end
%             end
%             
%         end
%         bo=bo&&x;
%     end
% end
