figure;
plot(saxis,meanSqDi,'LineWidth',5);
axis('auto');
% axis('position',[0 0 1 1]);
% set(gca,'FontSize',20);
set(gca,'FontSize',20,'LooseInset',get(gca,'TightInset'));
% axis tight;
% set(gca,'position',[0 0 1 1]);
% imshow(gcf,'border','tight','initialmagnification','fit');
title('mean square displacement');
saveas(gcf,'testv6.png');
% saveas(gcf,'Position',[0,0,500,500]);
% imwrite(gcf,'testv5.png');