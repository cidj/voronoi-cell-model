hE1234=zE1234-0.5*(y1E1234+y2E1234);
hUa1234=zUa1234-0.5*(y1Ua1234+y2Ua1234);
hUb1234=zUb1234-0.5*(y1Ub1234+y2Ub1234);
hUc1234=zUc1234-0.5*(y1Uc1234+y2Uc1234);
hEE=zEE-0.5*(y1EE+y2EE);
hUUa=zUUa-0.5*(y1UUa+y2UUa);
hUUb=zUUb-0.5*(y1UUb+y2UUb);
hUUc=zUUc-0.5*(y1UUc+y2UUc);
hfg=zfg-0.5*(y1fg+y2fg);

xaxi=[2.5,3,3.5,4,4.5,5];
figure;
% plot(hUa1234,hUb1234,'o');
plot(xaxi,hEE,'o-');