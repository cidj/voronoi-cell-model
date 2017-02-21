
load('alpA~p0_k0.5_L36/alpA~pp0_k0.5_L36/phasequantities.mat');
PQ=PQU;
figure;
hold on
for i=1:length(xclm);
plot(yclm'.*0.3129,PQ(:,i),'o-','LineWidth',2,'MarkerSize',8);
end
box on

