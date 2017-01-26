load([foldername,'/','parameter0.mat']);
anadatafile=[foldername,'/','anaresult.mat'];

XYfile=load(unitposifile);
status2=XYfile(:,1);
XYfile(:,1)=[];
timen=size(XYfile,1)/2;
dotnmd=size(XYfile,2);

AA=load(cellareafile);
status1=AA(:,1);
AA(:,1)=[];
cellnmd=size(AA,2);

PP=load(cellperimeterfile);
PP(:,1)=[];

EE=load(cellenergyfile);
EE(:,1)=[];

E=zeros(timen,cellnmd);
U1=zeros(timen,cellnmd);
U2=zeros(timen,cellnmd);
U3=zeros(timen,cellnmd);
for i=1:timen,
    [E(i,:),U1(i,:),U2(i,:),U3(i,:)]=cellener4( sp,a1,a2,a3,A0(:),PP(i,:),AA(i,:));
end

CePofile=load(cellcenterposifile);
CePofile(:,1)=[];
CC=cell(timen,1);
for i=1:timen,
    for j=1:cellnmd,
        CC{i}(j,1)=CePofile(2*i-1,j);
        CC{i}(j,2)=CePofile(2*i,j);
    end
end

ZZ=cell(timen,1);
ceneibo=zeros(timen,cellnmd);
ceineibodet=cell(timen,cellnmd);
allmultiuedges=cell(timen,cellnmd);
t0=clock;

for i=1:timen,
    ZZ{i}(:,1)=XYfile(2*i-1,:)';
    ZZ{i}(:,2)=XYfile(2*i,:)';
    ZZ{i}=maintaindistance(ZZ{i},unitnm,0.01,lengtha,lengthb);
    [ Poneibor,~,va,vb0,vb ]  = unitneibors( ZZ{i},lengtha,lengthb );
    [temp1,temp2]=cellneibors( Poneibor,unitnm );
    ceneibo(i,:)=temp1';
    for j=1:cellnmd,
        ceineibodet{i,j}=temp2{j};
        for nt=1:length(ceineibodet{i,j}),
            [ bo,lent ] = istwocellconnect( j,ceineibodet{i,j}(nt),unitnm,va,vb0,vb,dotnmd,lengtha,lengthb );
            if(bo)
                allmultiuedges{i,j}=[allmultiuedges{i,j},lent];
            else
                disp('bo error');
            end
        end    
    end 
    if(rem(i,10)==0),
        disp(['Processing cells:',num2str(i),' minutes=',num2str(etime(clock,t0)/60)]);
    end
end


isoqu=4*pi*AA./PP.^2;
%isoqu=PP./sqrt(AA);

rc=0.5*min(lengtha,lengthb);
rd=rc/100;
Hx  = rdf( cellcenterposifile,rc,rd,lengtha,lengthb,recstabsta );

xaxis=zeros(timen,1);
for i=1:timen,
    xaxis(i)=(i-1)*recN;
end

% neinnall=cell(cellnmd,1);
% for i=1:cellnmd
%     neinnall{i}= mknthneibs(i,ceineibodet);
%     disp(['mknthneibs: ',num2str(i)]);
% end

save(anadatafile,...
    'timen','dotnmd','cellnmd','status1',...
    'AA','PP','EE','CC','ZZ',...
    'U1','U2','U3',...
    'ceneibo','ceineibodet',...
    'isoqu','allmultiuedges',...
    'Hx','xaxis');

% save(anadatafile,'neinnall','-append');
% clearvars -except foldername t00;
disp('Analyse finished!');