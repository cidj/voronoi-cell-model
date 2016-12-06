function [ x ] = checkconnection_newfor40( i,vb,vb_n,dotnm )
%CHECKCONNECTION_NEWFOR4 Summary of this function goes here
%   Detailed explanation goes here

n=zeros(1,4);
checked=zeros(1,4);
for j=1:4,
    n(j)=cell2unit(i,j,4);
    checked(j)=j;
end
A=zeros(1,3);
for j=1:3,
    A(j)=neiborcpbc9( n(4),n(j),vb,vb_n,dotnm );
end
p1=sum(A);

if(p1==3)
    x=1;
    return;
end

if(p1==2)
    for j=1:3,
        if(A(j)==0)
            rest=setdiff(checked,[j,4]);
            for k=1:2,
                disp(['n(j)=',num2str(n(j))]);
                disp(['n(rest(k))=',num2str(n(rest(k)))]);
                if(neiborcpbc9(n(j),n(rest(k)),vb,vb_n,dotnm ))
                    x=1;
                    return;
                end
            end
            x=0;
            return;
        end
    end
end

if(p1==1)  
    s0=neiborcpbc9( n(1),n(2),vb,vb_n,dotnm );
    s0=s0+neiborcpbc9( n(2),n(3),vb,vb_n,dotnm );    
    if(s0>1)
        x=1;
    else
        s0=s0+neiborcpbc9( n(3),n(1),vb,vb_n,dotnm );       
        if(s0>1)
            x=1;
        else
            x=0;
        end
    end
    return;
end

if(p1==0)
    x=0;
    return;
end

end

