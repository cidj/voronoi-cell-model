tt=comed;
ttlim=100;
[yyy,xxx]=hist(tt,ttlim);
yyyln=-log(yyy/sum(yyy));
figure;
plot(xxx,yyyln,'o');
p=polyfit(xxx,yyyln,12);
f=polyval(p,tt');
hold on
plot(tt',f,'+');