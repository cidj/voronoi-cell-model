% geom=PPceisoqu_1234;
geom=meancagefor4ar;
figure;
subplot(3,3,1);
plot(geom,hfg(1:llen),'o');
title('hfg');

subplot(3,3,4);
plot(geom,hUa1234(1:llen),'o');
title('hUa1234');

subplot(3,3,5);
plot(geom,hUb1234(1:llen),'o');
title('hUb1234');

subplot(3,3,6);
plot(geom,hUc1234(1:llen),'o');
title('hUc1234');

subplot(3,3,7);
plot(geom,hUUa(1:llen),'o');
title('hUUa');

subplot(3,3,8);
plot(geom,hUUb(1:llen),'o');
title('hUUb');

subplot(3,3,9);
plot(geom,hUUc(1:llen),'o');
title('hUUc');
