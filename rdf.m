function [ Hx ] = rdf( cellcenterposifile,rc,rd,la,lb,tn )
%RDF Summary of this function goes here
%   Detailed explanation goes here

xyfile=load(cellcenterposifile);
xyfile(:,1)=[];
timen=size(xyfile,1)/2;
N=size(xyfile,2);

if (rc>0.5*la||rc>0.5*lb)
    disp('Warning: the maximum radius you have requested is greater than one-half the box length');
    rc= 0.5*min(la,lb);
end

c=zeros(N,2);
nr=ceil(rc/rd);
H=zeros(nr,1);
xx=zeros(nr,1);
for k=tn:timen,
    c(:,1)=xyfile(2*k-1,:)';
    c(:,2)=xyfile(2*k,:)';
   for i=1:N,
     for j=i+1:N,
       dx  = perodist(c(i,1)-c(j,1),la);
       dy  = perodist(c(i,2)-c(j,2),lb);
       dr = sqrt(dx^2 + dy^2);
       if (dr<rc) 
           bin=ceil(dr/rd);
           H(bin)=H(bin)+2;
       end
     end
   end
end
tnn=timen-tn+1;
  for i=1:nr,
    H(i)=H(i)/(2*i-1);
    xx(i)=(i-0.5)*rd;
  end
  co1=la*lb/(pi*rd^2*N^2*tnn);
  H=co1*H;
Hx=[xx,H];
end

