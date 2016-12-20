% load(parameterfile);
% load(anadatafile);

difdp=zeros(timen-1,cellnmd);
difag=zeros(timen-1,cellnmd);
for i=1:timen-1,
    for j=1:cellnmd,
        Celdisx=perodist(CC{i+1}(j,1)-CC{i}(j,1),lengtha);
        Celdisy=perodist(CC{i+1}(j,2)-CC{i}(j,2),lengthb);
        difdp(i,j)=sqrt(Celdisx^2+Celdisy^2);
        difag(i,j)=atan2d(Celdisy,Celdisx);
    end
end

difEE=zeros(timen-1,cellnmd);
difU1=zeros(timen-1,cellnmd);
difU2=zeros(timen-1,cellnmd);
difU3=zeros(timen-1,cellnmd);
difAA=zeros(timen-1,cellnmd);
difPP=zeros(timen-1,cellnmd);
difisoqu=zeros(timen-1,cellnmd);
difcasra=zeros(timen-1,cellnmd);
difceneibo=zeros(timen-1,cellnmd);
difcvx=zeros(timen-1,cellnmd);
difvxn=zeros(timen-1,cellnmd);
difvxr=zeros(timen-1,cellnmd);
for i=1:timen-1,
    for j=1:cellnmd,
        difEE(i,j)=EE(i+1,j)-EE(i,j);
        difU1(i,j)=U1(i+1,j)-U1(i,j);
        difU2(i,j)=U2(i+1,j)-U2(i,j);
        difU3(i,j)=U3(i+1,j)-U3(i,j);
        difAA(i,j)=AA(i+1,j)-AA(i,j);
        difPP(i,j)=PP(i+1,j)-PP(i,j);
        difisoqu(i,j)=isoqu(i+1,j)-isoqu(i,j);
        difcasra(i,j)=casra(i+1,j)-casra(i,j);
        difceneibo(i,j)=ceneibo(i+1,j)-ceneibo(i,j);
        difcvx(i,j)=cellcvx(i+1,j)-cellcvx(i,j);
        difvxn(i,j)=cellvxn(i+1,j)-cellvxn(i,j);
        difvxr(i,j)=cellvxr(i+1,j)-cellvxr(i,j);
    end
end
% ab=autocorr(difdp(:,5));
% plot(ab)
figure;
c=xcov(difdp,'coeff');
[cc,pp]=corrcoef(difdp);
[ii,jj]=find(pp<0.005);
plot(cc);

% ab=xcorr(difdp(:,5),difisoqu(:,5));
% plot(ab);
% [a,b]=xcorr(difdp(:,5),'unbiased');
% plot(b,a);
% plot(difdp(:,5),difisoqu(:,5),'O');
% xlabel('displacement');
% ylabel('energy change');