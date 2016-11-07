clear figure
clear all
clc
cellnm=80;
celllen=15;
celluni=3;
cellunilen=celllen/celluni;
dotnm=cellnm*celluni;
rawedge=sqrt(dotnm)*cellunilen;
%drawedge=rawedge*0.8;
rng('default');
aa=ones(dotnm,2);
aa(:,1)=rawedge*rand(dotnm,1);
aa(:,2)=rawedge*rand(dotnm,1);
% a=[0 -.5 1 1 -1]';
% b=[0 -1 -.5 1 1]';
figure;
% scatter(a,b,'+');
% hold on
plot(aa(:,1),aa(:,2),'O');
% [va,vb]=voronoin([aa(:,1), aa(:,2)]);
[va,vb]=voronoin(aa);
% for k=1:length(vb{1}-1,
% plot([va(vb{1}(1),1),va(vb{1}(1),2)],[va(vb{1}(2),1),va(vb{1}(2),2)],'r')
%plot([va(vb{1}(1),1),va(vb{1}(2),1)],[va(vb{1}(1),2),va(vb{1}(2),2)],'r')
% for i=1:length(vb),
%     for j=1:length(vb{i})-1,
%         %         disp(vb{i});
%         %         plot([va(j,1),va(j,2)],[va(j+1,1),va(j+1,2)]);
%         plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)])
%         hold on;
%     end
% end

%     l=length(vb{1});
%     for j=1:length(vb{1})-1,
%         plot([va(vb{1}(j),1),va(vb{1}(j+1),1)],[va(vb{1}(j),2),va(vb{1}(j+1),2)],'g')
%         hold on;
%     end
%     plot([va(vb{1}(l),1),va(vb{1}(1),1)],[va(vb{1}(l),2),va(vb{1}(1),2)],'g')
%         l=length(vb{2});
%     for j=1:length(vb{2})-1,
%         plot([va(vb{2}(j),1),va(vb{2}(j+1),1)],[va(vb{2}(j),2),va(vb{2}(j+1),2)],'r')
%         hold on;
%     end
%     plot([va(vb{2}(l),1),va(vb{2}(1),1)],[va(vb{2}(l),2),va(vb{2}(1),2)],'r')
 
for i=1:length(vb),
    l=length(vb{i});
    for j=1:length(vb{i})-1,
        plot([va(vb{i}(j),1),va(vb{i}(j+1),1)],[va(vb{i}(j),2),va(vb{i}(j+1),2)],'g')
        hold on;
    end
    plot([va(vb{i}(l),1),va(vb{i}(1),1)],[va(vb{i}(l),2),va(vb{i}(1),2)],'g')
    plot(aa(i,1),aa(i,2),'O','MarkerEdgeColor','y','MarkerFaceColor','y')
    text(aa(i,1),aa(i,2),num2str(i),'FontSize',8);
   % hold on;
end
axis equal;
axis([0,rawedge,0,rawedge]);
