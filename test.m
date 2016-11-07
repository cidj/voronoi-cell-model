MM=[0,0;5,5];
while 1
plot([MM(1,1),MM(2,1)],[MM(1,2),MM(2,2)]);
axis([0,5,0,5]);
axis equal;
pause;
[MM(1,:),MM(2,:)]=makecloser(MM(1,:),MM(2,:),0.99);
end