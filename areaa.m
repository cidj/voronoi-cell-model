function [ Si ] = areaa( cet,va,vbi  )
%AREAA Summary of this function goes here
%   Detailed explanation goes here
   l=length(vbi);
   Si=ones(l,1);
    for j=1:l-1,
%         ado= [va(vbi(j),1),va(vbi(j),2)];
%         bdo= [va(vbi(j+1),1),va(vbi(j+1),2)];
%         ac=ado-cet;
%         bc=bdo-cet;
%         M=[ac;bc];
        ac= va(vbi(j),:)-cet;
        bc= va(vbi(j+1),:)-cet;      
        Si(j)=1/2*abs(det([ac;bc]));
    end
        ac=va(vbi(l),:)-cet;
        bc=va(vbi(1),:)-cet;    
        Si(l)=1/2*abs(det([ac;bc]));
end

