function [ cor,cpospor,cmean ] = timepcorrcoe( ta1,ta2,tb1,tb2,quan,neinnall )
%TIMEPCORRCOE Summary of this function goes here
%   Detailed explanation goes here
% t=10;
cellnm=size(neinnall,1);
nn=size(neinnall{1},2);
tn=ta2-ta1+1;
cor=cell(cellnm,tn,nn);
% cpospor=zeros(tn,cellnm,nn);
cpospor=cell(tn,1);
cmean=cell(tn,1);
aaa=corrcoef(quan(tb1:tb2,:));
for i=1:cellnm,
    for j=ta1:ta2,
        bbb=[];
        ccc=[];
        for k=1:nn,
            for kk=1:length(neinnall{i}{j,k}),
                cor{i,j-ta1+1,k}(kk)=aaa(i,neinnall{i}{j,k}(kk));
            end
            bbb=[bbb,pospor(cor{i,j-ta1+1,k})];
            ccc=[ccc,mean(cor{i,j-ta1+1,k})];
        end
        cpospor{j-ta1+1}(i,:)=bbb;
        cmean{j-ta1+1}(i,:)=ccc;
    end
%     disp(i);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cellnm=size(neinnall,1);
% nn=size(neinnall{1},2);
% timen=size(neinnall{1},1);
% cor=cell(cellnm,timen,nn);
% % cpospor=zeros(timen,cellnm,nn);
% cpospor=cell(timen,1);
% aaa=corrcoef(quan(tb1:tb2,:));
% for i=1:cellnm,
%     for j=1:timen,
%         bbb=[];
%         for k=1:nn,
%             for kk=1:length(neinnall{i}{j,k}),
%                 cor{i,j,k}(kk)=aaa(i,neinnall{i}{j,k}(kk));
%             end
%             bbb=[bbb,pospor(cor{i,j,k})];
%         end
%         cpospor{j}(i,:)=bbb;
%     end
%     disp(i);
% end


end

