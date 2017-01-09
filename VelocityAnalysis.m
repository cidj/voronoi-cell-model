% load([foldername,'/','parameter0.mat']);
% load([foldername,'/','anaresult.mat']);

velocityfile=[foldername,'/','velocities.mat'];

Vcel=zeros(timen-1,cellnmd);
for i=1:timen-1,
    for j=1:cellnmd,
        Celdisx=perodist(CC{i+1}(j,1)-CC{i}(j,1),lengtha);
        Celdisy=perodist(CC{i+1}(j,2)-CC{i}(j,2),lengthb);
        Vcel(i,j)=sqrt(Celdisx^2+Celdisy^2);
    end
end
Vcel=Vcel/recN;
meanVV=mean(Vcel,2);
stdVV=std(Vcel,0,2);
mV=mean(meanVV(recstabsta:end));
sV=mean(stdVV(recstabsta:end));

SqDi=zeros(timen-recstabsta,cellnmd);
saxis=zeros(timen-recstabsta,1);
for i=recstabsta+1:timen,
    saxis(i-recstabsta)=i;
    for j=1:cellnmd,
        Celdisx=perodist(CC{i}(j,1)-CC{recstabsta}(j,1),lengtha);
        Celdisy=perodist(CC{i}(j,2)-CC{recstabsta}(j,2),lengthb);
        SqDi(i-recstabsta,j)=Celdisx^2+Celdisy^2;
    end
end

meanSqDi=mean(SqDi,2);
stdSqDi=std(SqDi,0,2);

save(velocityfile,...
    'Vcel','meanVV','stdVV','mV','sV',...
    'SqDi','meanSqDi','stdSqDi','saxis');
% clearvars -except foldername t00;
disp('VelocityAnalysis finished.');