function [ xaxi,yaxi,out,aav ] = gethist( qx,xli,qy,yli )
%GETHIST Summary of this function goes here
%   Detailed explanation goes here
% qx=comed;
% qy=cE13;
% xli=50;
% yli=100;

% qx=tt;
% xli=ttlim;
% qy=cE1234;
% yli=otherlim;

t=length(qx);
qxma=max(qx);
qxmi=min(qx);
qyma=max(qy);
qymi=min(qy);

xint=(qxma-qxmi)/xli;
yint=(qyma-qymi)/yli;
xaxi=qxmi+0.5*xint:xint:qxmi+(xli-0.5)*xint;
yaxi=qymi+0.5*yint:yint:qymi+(yli-0.5)*yint;

out=zeros(xli,yli);
grx=cell(xli,1);
aav=zeros(xli,1);

for i=1:t,
    ix=floor((qx(i)-qxmi)/xint)+1;
    iy=floor((qy(i)-qymi)/yint)+1;
    if(ix<=xli&&iy<=yli)
        out(ix,iy)=out(ix,iy)+1;
        grx{ix}=[grx{ix},qy(i)];
    end
end

for i=1:xli,
    aav(i)=mean(grx{i});
end
 
% figure;
% plot(xaxi,aav,'o');
% xlabel('common edge length');
% ylabel('Energy');
    
% figure;
% surf(xaxi,yaxi,out);
% xlabel('common edge length');
% ylabel('Energy');
% zlabel('number of points');
%     shading interp;

% if(isnan(aav(end)))
%     disp('yes');
% end
end

