tt=comed;
ttlim=100;
[yyy,xxx]=hist(tt,ttlim);
yyyln=-log(yyy/sum(yyy));
h1=figure('Name','Free energy');
plot(xxx,yyyln);
title('Free energy');
saveas(h1,[foldername,'/p_fe.fig']);
close(h1);