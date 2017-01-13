function [ did,nm,vdi,vba ] = mergeunits1( va,vb)
%COMMONNUMBER Summary of this function goes here
%   Detailed explanation goes here

la=length(va);
lb=length(vb);

vba=vb;
    
[yn,ia,ib]=findonecompoint(va,vb);

if(yn==0)
    nm=0;
    vdi=va;
    did=0;
    vba=[];
    return;
end

nm=1;
if(va(peris(ia+1,la))==vb(peris(ib-1,lb))||va(peris(ia-1,la))==vb(peris(ib+1,lb)))
elseif(va(peris(ia+1,la))==vb(peris(ib+1,lb))||va(peris(ia-1,la))==vb(peris(ib-1,lb)))
    vb=vb(end:-1:1);
    ib=lb-ib+1;
else
    vdi=va;
    did=0;
    return;
end

while(va(peris(ia-1,la))==vb(peris(ib+1,lb)))
    ia=peris(ia-1,la);
    ib=peris(ib+1,lb);
end

for i=1:min(la,lb)-1,
    
    if(va(peris(ia+i,la))==vb(peris(ib-i,lb))),
        nm=nm+1;
    else
        break;
    end
end

van=arrayrotate(peris(ia+nm-1,la),la-nm+1,va);
vbn=arrayrotate(ib,lb-nm+1,vb);
vdi=[van,vbn];

if(length(vdi)~=length(unique(vdi)))
    vdi=ployunion( va,vb );
    disp('ployunion called.');
end
did=1;
end

