clearvars -except foldername t00 ...
    ZZ CC AA PP EE U1 U2 U3...
    ceineibodet isoqu casra cmaa cvxys...
    unitnm lengtha lengthb motcels timen;

localcellsfile=[foldername,'/','localcells.mat'];

t1=1;
t2=timen;

c1=motcels(1);
c2=motcels(2);
c3=motcels(3);
c4=motcels(4);

ca1=zeros(1,t2-t1+1);
ca2=zeros(1,t2-t1+1);
ca3=zeros(1,t2-t1+1);
ca4=zeros(1,t2-t1+1);

car1234=zeros(1,t2-t1+1);
ca1234=zeros(1,t2-t1+1);

comed13=zeros(1,t2-t1+1);
comed24=zeros(1,t2-t1+1);
comed1234=zeros(4,t2-t1+1);

% comA=zeros(1,t2-t1+1);
% comP=zeros(1,t2-t1+1);
% comP_ed=zeros(1,t2-t1+1);

cagefor4  = cagecells( motcels,ceineibodet );
cagefor4ar=zeros(1,t2-t1+1);
cagefor4a=zeros(1,t2-t1+1);
cagein4ar=zeros(1,t2-t1+1);
cagein4a=zeros(1,t2-t1+1);
cageedga=zeros(1,t2-t1+1);

for i=t1:t2,
    
    j=i-t1+1;
    
    [cagefor4ar(j),cagefor4a(j),~,~,~,~,~]=aspectratio(ZZ{j}(cagefor4{j},:));
    [cagein4ar(j),cagein4a(j),~,~,~,~,~]=aspectratio(ZZ{j}(motcels,:));
    
    maax=atan2d(CC{i}(c3,2)-CC{i}(c1,2),CC{i}(c3,1)-CC{i}(c1,1));
    ca1(j)=intsecang(cmaa(i,c1),maax);
    ca2(j)=intsecang(cmaa(i,c2),maax);
    ca3(j)=intsecang(cmaa(i,c3),maax);
    ca4(j)=intsecang(cmaa(i,c4),maax);
    
    [car1234(j),cageedga(j),~,~,~,~,~] = aspectratio([cvxys{i,c1};cvxys{i,c2};cvxys{i,c3};cvxys{i,c4}]);
    ca1234(j)=intsecang(cageedga(j), maax);
    
    [ pair, ring ] = comedgelens( motcels, ZZ{i},unitnm, lengtha,lengthb );
    comed13(j)=pair(1);
    comed24(j)=pair(2);
    comed1234(:,j)=ring;
    
    disp(i);
    
end

car1=casra(t1:t2,c1)';
car2=casra(t1:t2,c2)';
car3=casra(t1:t2,c3)';
car4=casra(t1:t2,c4)';

ceE1=EE(t1:t2,c1)';
ceE2=EE(t1:t2,c2)';
ceE3=EE(t1:t2,c3)';
ceE4=EE(t1:t2,c4)';

cEE=sum(EE(t1:t2,:),2)';
cE13=ceE1+ceE3;
cE24=ceE2+ceE4;
cE1234=cE13+cE24;

ceU1_1=U1(t1:t2,c1)';
ceU1_2=U1(t1:t2,c2)';
ceU1_3=U1(t1:t2,c3)';
ceU1_4=U1(t1:t2,c4)';

cUU1=sum(U1(t1:t2,:),2)';
cU1_13=ceU1_1+ceU1_3;
cU1_24=ceU1_2+ceU1_4;
cU1_1234=cU1_13+cU1_24;

ceU2_1=U2(t1:t2,c1)';
ceU2_2=U2(t1:t2,c2)';
ceU2_3=U2(t1:t2,c3)';
ceU2_4=U2(t1:t2,c4)';

cUU2=sum(U2(t1:t2,:),2)';
cU2_13=ceU2_1+ceU2_3;
cU2_24=ceU2_2+ceU2_4;
cU2_1234=cU2_13+cU2_24;

ceU3_1=U3(t1:t2,c1)';
ceU3_2=U3(t1:t2,c2)';
ceU3_3=U3(t1:t2,c3)';
ceU3_4=U3(t1:t2,c4)';

cUU3=sum(U3(t1:t2,:),2)';
cU3_13=ceU3_1+ceU3_3;
cU3_24=ceU3_2+ceU3_4;
cU3_1234=cU3_13+cU3_24;

ceAA_1=AA(t1:t2,c1)';
ceAA_2=AA(t1:t2,c2)';
ceAA_3=AA(t1:t2,c3)';
ceAA_4=AA(t1:t2,c4)';

cAA_13=ceAA_1+ceAA_3;
cAA_24=ceAA_2+ceAA_4;
cAA_1234=cAA_13+cAA_24;

ceisoqu_1=isoqu(t1:t2,c1);
ceisoqu_2=isoqu(t1:t2,c2);
ceisoqu_3=isoqu(t1:t2,c3);
ceisoqu_4=isoqu(t1:t2,c4);

edlabad=comed1234(1,:)+comed1234(4,:);
edlcdcb=comed1234(2,:)+comed1234(3,:);
edlabcd=sum(comed1234,1);
edlabcde=edlabcd+comed13+comed24;
edlsurr=PP(:,c1)'+PP(:,c2)'+PP(:,c3)'+PP(:,c4)'-edlabcde;
ceisoqu_1234=4*pi*cAA_1234./edlsurr.^2;

comed=comed13-comed24;
ti=t1:1:t2;
save(localcellsfile,'t1', 't2', 'c1', 'c2', 'c3', 'c4',...
    'ca1', 'ca2', 'ca3', 'ca4','ca1234', 'car1', 'car2', 'car3', 'car4','car1234',...
    'ceE1', 'ceE2', 'ceE3', 'ceE4', 'cE13', 'cE24', 'cE1234', 'cEE',...
    'ceU1_1', 'ceU1_2', 'ceU1_3', 'ceU1_4', 'cU1_13', 'cU1_24', 'cU1_1234', 'cUU1',...
    'ceU2_1', 'ceU2_2', 'ceU2_3', 'ceU2_4', 'cU2_13', 'cU2_24', 'cU2_1234', 'cUU2',...
    'ceU3_1', 'ceU3_2', 'ceU3_3', 'ceU3_4', 'cU3_13', 'cU3_24', 'cU3_1234', 'cUU3',...
    'ceAA_1', 'ceAA_2', 'ceAA_3', 'ceAA_4', 'cAA_13', 'cAA_24', 'cAA_1234',...
    'ceisoqu_1', 'ceisoqu_2', 'ceisoqu_3', 'ceisoqu_4','ceisoqu_1234',...
    'edlabad','edlcdcb','edlabcd','edlabcde','edlsurr',...
    'comed13', 'comed24','comed1234', 'comed', 'ti',...
    'cagefor4ar','cagefor4a','cagein4ar','cagein4a','cageedga');

