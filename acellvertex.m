function [ vci] = acellvertex(i,unitnm,vb,vb_n )
%FINDCELLVETEX Summary of this function goes here
%   Detailed explanation goes here
% i=2;
% vb_n=vb;
% vb=vb0;
lb=length(vb);
rec=ones(1,unitnm-1);
nn=cell2unit(i,unitnm,unitnm);
vci=vb{nn};
trylimit=unitnm*(unitnm-1)/2;
cl=0;

while (ismember(1,rec))
    if(cl<=trylimit),
        for j=1:unitnm-1,
            if(rec(j)==1),
                nj=cell2unit(i,j,unitnm);
                [ did,~,vdi,~] = merge9( vci,nj,vb,vb_n,lb );
                cl=cl+1;
                if(did)
                    vci=vdi;
                    rec(j)=0;
                    %disp(rec);
                end
            end
        end
    else
        [~,j]=ismember(1,rec);
        disp(['acellvertex: ',num2str(i),'-',num2str(j),' merge error.']);
        break;
    end
end

% while (cl<=trylimit)
%     [~,jin]=find(rec==1);
%     if(isempty(jin)),
%         break;
%     end
%     for jj=1:length(jin)
%         j=jin(jj);      
%         nj=cell2unit(i,j,unitnm);
%         [ did,~,vdi,~] = merge9( vci,nj,vb,vb_n,lb );
%         cl=cl+1;
%         if(did)
%             vci=vdi;
%             rec(j)=0;
%         end
%     end
% end
% 
% [in,j]=ismember(1,rec);
% if(in),    
%     disp(['acellvertex: ',num2str(i),'-',num2str(j),' merge error.']);
% %     error('dd');
% end

% isring=0;
% while (ismember(1,rec))
%     if(cl<=trylimit),
%         for j=1:unitnm-1,
%             if(rec(j)==1),
%                 nj=cell2unit(i,j,unitnm);
%                 [ did,~,vdi,~] = merge9( vci,nj,vb,vb_n,lb );
%                 cl=cl+1;
%                 if(did)
%                     vci=vdi;
%                     rec(j)=0;
%                     %disp(rec);
%                 end
%             end
%         end
%     else
%         disp('There may be a ring formed!');
%         break;
%     end
% end
%
% if(ismember(1,rec))
%     isring=1;
%     vxi=vci;
%     clring=0;
%     while (ismember(1,rec))
%         if(clring<=unitnm-1),
%             for i=1:unitnm-1,
%                 if(rec(j)==1),
%                     nj=cell2unit(i,j,unitnm);
%                     [ ~,nm,~,vba] = merge9( vxi,nj,vb,vb_n,lb );
%                     if(nm)
%                         vci=[vci,vba];
%                         rec(j)=0;
%                         clring=clring+1;
%                     end
%                 end
%             end
%         else
%             isring=-1;
%         end
%     end
% end
% if(isring==-1)
%     error('Cell units merging failed!');
% end
end

