function [ Pi ] = perimetera( va,vbi )
%PERIMETERA Summary of this function goes here
%   Detailed explanation goes here  
   l=length(vbi);
   Pi=zeros(l,1); 
    for j=1:l-1,
        %Pi(j)=norm([va(vbi(j),2)-va(vbi(j),1);va(vbi(j+1),2)-va(vbi(j+1),1)]);
        Pi(j)=norm([va(vbi(j+1),1)-va(vbi(j),1),va(vbi(j+1),2)-va(vbi(j),2)]);
    end
 %Pi(l)=norm([va(vbi(1),2)-va(vbi(l),1);va(vbi(1),2)-va(vbi(l),1)]);
 Pi(l)=norm([va(vbi(1),1)-va(vbi(l),1),va(vbi(1),2)-va(vbi(l),2)]);
end

