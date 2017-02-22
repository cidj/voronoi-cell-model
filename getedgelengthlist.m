function [ edges ] = getedgelengthlist( aarri,bceli,lengtha,lengthb )
%GETEDGELENGTHLIST Summary of this function goes here
%   Detailed explanation goes here
len=length(bceli);
edges=cell(len,1);
for i=1:len,
    
    edges{i}=getedges(aarri,bceli{i},lengtha,lengthb );
%     leni=length(bceli{i});
%     colleg=zeros(leni,1);
%     
%     for j=1:leni,
%         colleg(i) = distanpero( aarri(bceli{i}(peris(j+1,leni)),1),aarri(bceli{i}(peris(j+1,leni)),2),aarri(bceli{i}(j),1),aarri(bceli{i}(j),1),lengtha,lengthb );
%   
%     end
%     aarrii=aarri(bceli{i},:);
%     [xy,~ ] = movegrouptocenter(aarrii,bceli{i},lengtha,lengthb );
%     
%     xx=[xy(:,1);xy(1,2)];
%     yy=[xy(:,2);xy(1,2)];
%     
%     edges{i} =sqrt(diff(xx).^2+ diff(yy).^2);
    
end   
    
end

