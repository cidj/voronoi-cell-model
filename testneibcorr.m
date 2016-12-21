t1=600;
t2=700;
timen=size(ceineibodet,1);
cellnmd=size(ceineibodet,2);
nn=floor(sqrt(cellnmd)/2);

[cor,cpospor,cmean]=timepcorrcoe(t1,t2,AA,neinnall);
figure;
% surf(cpospor{10});
aa=1:1:64;
bb=1:1:4;
subplot(1,2,1);
pcolor(bb,aa,cpospor{10});
% mesh(bb,aa,cpospor{10});
% shading interp;
view([0 0 1]);
subplot(1,2,2);
pcolor(bb(2:end),aa,cmean{10}(:,2:end));
% mesh(bb(2:end),aa,cmean{10}(:,2:end));
% shading interp;
view([0 0 1]);

% tn=size(cor,2);
% result=zeros(tn,4);
% porats=zeros(tn,4);
% for i=1:tn,
%     result(i,:)=[mean(cor{i,1}),mean(cor{i,2}),mean(cor{i,3}),mean(cor{i,4})];
%     porats(i,:)=[length(find(cor{i,1}>0))/length(cor{i,1}),...
%         length(find(cor{i,2}>0))/length(cor{i,2}),...
%         length(find(cor{i,3}>0))/length(cor{i,3}),...
%         length(find(cor{i,4}>0))/length(cor{i,4})];
% end

