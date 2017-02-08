function [vdi] = joinsvertex( va,vb)
%COMMONNUMBER Summary of this function goes here
%   Detailed explanation goes here

la=length(va);
lb=length(vb);

    
[yn,ia,ib]=findonecompoint(va,vb);

if(yn==0)
    vdi=[];
    return;
end

if(va(peris(ia+1,la))==vb(peris(ib-1,lb))||va(peris(ia-1,la))==vb(peris(ib+1,lb)))
elseif(va(peris(ia+1,la))==vb(peris(ib+1,lb))||va(peris(ia-1,la))==vb(peris(ib-1,lb)))
    vb=vb(end:-1:1);
    ib=lb-ib+1;
else
    vdi=[];
    return;
end

while(va(peris(ia-1,la))==vb(peris(ib+1,lb)))
    ia=peris(ia-1,la);
    ib=peris(ib+1,lb);
end

nm=1;
for i=1:min(la,lb)-1,
    if(va(peris(ia+i,la))==vb(peris(ib-i,lb))),
        nm=nm+1;
    else
        break;
    end
end

van=arrayrotate(peris(ia+nm-1,la),la-nm+1,va);
vbn=arrayrotate(ib,lb-nm+1,vb);
vdi=[van,vbn]';

end

