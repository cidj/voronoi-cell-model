vv=[9,10,12,14,5,4,3,13,11,2,6,7,3,4,5,8,1];
% vv=[9,10,12,14,5,13,11,2,6,7,5,8,1];
% vv=[9,10,12,14,5,4,3,7,3,4,5,8,1];
lv=length(vv);
si=[];
for i=1:lv,
    a=vv(i);
    for j=i+1:lv,
        b=vv(j);
        if(a==b),
            si=[i,j];
            break;
        end
    end
    if(~isempty(si))
        break;
    end
end
if(~isempty(si)),
    ia=si(1);
    ib=si(2);
    if(vv(peris(ia+1,lv))==vv(peris(ib-1,lv)))
        while(vv(peris(ia-1,lv))==vv(peris(ib+1,lv)))
            ia=peris(ia-1,lv);
            ib=peris(ib+1,lv);
        end
        ia0=ia;
        ib0=ib;
        while(vv(peris(ia+1,lv))==vv(peris(ib-1,lv)))
            ia=peris(ia+1,lv);
            ib=peris(ib-1,lv);
        end
        av=secarr(vv,ib0,peris(ia0-1,lv));
        bv=secarr(vv,ia,peris(ib-1,lv));
        uu=[av,nan,bv];
        disp(uu);
    elseif(vv(ia+1)==vv(ib-1))
        disp('Topological twist.');
    else
        disp('One point ring.');
    end
end
