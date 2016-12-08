%
%
%
%  Test the data density plot
%
t0=clock;
% x = randn(2048, 1);
% y = randn(2048, 1);
% x(1:512) = x(1:512) + 2.75;
% x(1537:2048) = x(1537:2048) + 2.75;
% y(1025:2048) = y(1025:2048) + 2.75;
N=30;
la0=-4;
lb0=-4;
lengtha=12;
lengthb=12;
x=la0+lengtha*rand(N,1);
y=lb0+lengthb*rand(N,1);
XY=[x,y];

% On scatter plot you probably can't see the data density
figure('name','newd');
subplot(1,2,1);
scatter(x, y);
axis([-4,8,-4,8]);
subplot(1,2,2);
DataDensityPlot(x, y, 300,300,128,[-4,8,-4,8]);
axis([-4,8,-4,8]);

disp(num2str(etime(clock,t0)));
