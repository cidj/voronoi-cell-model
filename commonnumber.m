function [ yn,si,nm,vsa,vdi ] = commonnumber( va,vb)
%COMMONNUMBER Summary of this function goes here
%   Detailed explanation goes here

la=length(va);
lb=length(vb);

[yn,ia,ib]=findonecompoint(va,vb);

if(yn==0)
    si=0;
    nm=0;
    vsa=[];
    vdi=[];
    return;
end


if(va(peris(ia+1,la))==vb(peris(ib+1,lb)))
    si=1;
elseif(va(peris(ia+1,la))==vb(peris(ib-1,lb)))
    si=-1;
else
    si=0;
end

if(si>0),
    vb=vb(end:-1:1);
    ib=lb-ib+1;
end

nm=1;
for i=1:min(la,lb)-1,

    if(va(peris(ia+i,la))==vb(peris(ib-i,lb))),
        nm=nm+1;
    else        
        break;
    end
end

vsa=zeros(1,nm);
for i=1:nm,
    vsa(i)=va(peris(ia+i-1,la));
end
va=arrayrotate(ia+nm-1,la-nm+1,va);
vb=arrayrotate(ib,lb-nm+1,vb);
vdi=[va,vb];

end

