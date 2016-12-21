% load('anaresult.mat')
% load('parameter0.mat')
% % figure;
% c=xcov(difdp,'coeff');
% [cc,dd]=corrcoef(difisoqu,difPP);
% A=rand(10,1);
% B=2*A;
% C=[B(1:5);rand(5,1);];
% aa=corrcoef(A,B);
% bb=corrcoef(A,C);
% cc=corrcoef(A(1:5),C(1:5));
% [cc2,dd2]=corrcoef(PP);
% [cc1,dd1]=corrcoef(AA(501:534,1),AA(501:534,2));
[cc2,dd2]=corrcoef(AA(501:1001,:));
% [cc2,dd2]=corrcoef(AA,EE);
[cc20,dd20]=corr(AA,EE);
[ii1,jj1]=find(abs(cc2)>0.3);
[ii2,jj2]=find(dd2<0.05);
iijj1=[ii1,jj1];
iijj2=[ii2,jj2];
iijj=intersect(iijj1,iijj2,'rows');
[cc3,dd3]=xcorr(AA(1:57,1),AA(1:57,2),'coeff');
figure;plot(dd3,cc3);
figure; surf(cc2);
% figure;
% plot(cc2);





% [c,d]=corrcoef(difdp(:,42),difdp(:,43));



% c=xcorr(difPP(:,10),difPP(:,11),'coeff');
% c=xcorr(difisoqu(:,10),difAA(:,10),'coeff');

% plot(c);
