selected=11;
nn=floor(sqrt(cellnmd)/2);
neinn=cell(timen,nn);

for i=1:timen,
    all=union([],selected);
    neinn{i,1}=selected;
    for j=2:nn,
    thatnew=findneibors(i,neinn{i,j-1}, ceineibodet);
    neinn{i,j}=setdiff(thatnew,all);
    all=union(thatnew,all);
    end
end

i=10;
cor=cell(nn,1);
for j=1:nn,
    for kk=1:length(neinn{i,j}),
        aaa=corrcoef(isoqu(:,selected),isoqu(:,neinn{i,j}(kk)));
        cor{j}(kk)=aaa(1,2);
    end
end
result=[mean(cor{1}),mean(cor{2}),mean(cor{3}),mean(cor{4})];
