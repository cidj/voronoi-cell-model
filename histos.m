[ xaxi13,yaxi13,out13,aav13 ] = gethist( comed,100,cE13,150 );
[ xaxi24,yaxi24,out24,aav24 ] = gethist( comed,100,cE24,150 );
[ xaxi1234,yaxi1234,out1234,aav1234 ] = gethist( comed,50,cE1234,100 );
[ xaxi,yaxi,out,aav ] = gethist( comed,50,cEE,100 );

 
figure;
subplot(1,2,1);
plot(xaxi1234,aav1234,'or');
title('Energy of four cells');
subplot(1,2,2);
plot(xaxi,aav,'+g');
title('Energy of all cells');
figure;
hold on
plot(xaxi1234,aav1234-min(aav1234),'or');
plot(xaxi,aav-min(aav),'+b');
xlabel('common edge length');
ylabel('Energy');
title('average anergy for the previous figure');
figure;
surf(xaxi,yaxi,out');
xlabel('common edge length');
ylabel('Energy');
zlabel('number of points');
shading interp;
