function [ did,nm,si,vsa,vdi,vba ] = mergeunits( va,vb)
%COMMONNUMBER Summary of this function goes here
%   Detailed explanation goes here

% disp(va);
% disp(vb);

la=length(va);
lb=length(vb);

% if((ismember(inf,va))||(ismember(inf,vb)))
%     pause;
% end

% if(la==11&&lb==7)
%     pause;
% end

vba=vb;
    
[yn,ia,ib]=findonecompoint(va,vb);

if(yn==0)
    si=0;
    nm=0;
    vsa=[];
    vdi=va;
    did=0;
    vba=[];
    return;
end

nm=1;
if(va(peris(ia+1,la))==vb(peris(ib-1,lb))||va(peris(ia-1,la))==vb(peris(ib+1,lb)))
    si=-1;
elseif(va(peris(ia+1,la))==vb(peris(ib+1,lb))||va(peris(ia-1,la))==vb(peris(ib-1,lb)))
    si=1;
    vb=vb(end:-1:1);
    ib=lb-ib+1;
else
    si=0;
    vsa=va(ia);
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

vsa=zeros(1,nm);
for i=1:nm,
    vsa(i)=va(peris(ia+i-1,la));
end

van=arrayrotate(peris(ia+nm-1,la),la-nm+1,va);
vbn=arrayrotate(ib,lb-nm+1,vb);
vdi=[van,vbn];

if(length(vdi)~=length(unique(vdi)))
    %     error('wrong!');
    vdi=va;
    did=0;
else
    did=1;
end
end

