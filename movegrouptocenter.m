function [  va,vbi ] = movegrouptocenter( va,vbi,sa,la,sb,lb )
%MOVEGROUPTOGETHER Summary of this function goes here
%   Detailed explanation goes here
kk=0;
for i=1:length(vbi),
    if (inregion( va(vbi(i),1),va(vbi(i),2),sa,la,sb,lb ))
        kk=i;
        break;
    end
end
if(kk==0)
    return;
end
for i=1:length(vbi),
    if(i~=kk)
        [ va(vbi(i),:),~ ] = movetogether( va(vbi(kk),:),va(vbi(i),:),la,lb);
    end
end
end
