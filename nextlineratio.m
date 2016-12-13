function [ kmax,mmax,kmin,mmin ] = nextlineratio( pp,n )
%NEXTLINERATIO Summary of this function goes here
%   Detailed explanation goes here
n=6;
len=length(pp);
xn=pp(n,1);
yn=pp(n,2);
xm=pp(n+1,1);
ym=pp(n+1,2);
km=(ym-yn)/(xm-xn);
kmax=km;
kmin=km;
mmax=n+1;
mmin=n+1;
for i=n+2:n+len-1,
    ii=peris(i,len);
        xm=pp(ii,1);
        ym=pp(ii,2);
        km=(ym-yn)/(xm-xn);
        if(km>kmax)
            kmax=km;
            mmax=ii;
%             disp(['kmax= ',num2str(kmax)]);
%             disp(['mmax= ',num2str(mmax)]);
        end
        if(km<kmin)
            kmin=km;
            mmin=ii;
%             disp(['kmin= ',num2str(kmin)]);
%             disp(['mmin= ',num2str(mmin)]);
        end
end
end

