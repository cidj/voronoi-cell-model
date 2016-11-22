function [ E ] = cellener( sp,a1,a2,a3,A0,P,A )
%TOTENER Summary of this function goes here
%   Detailed explanation goes here
cellnm=length(A0);
E=zeros(cellnm,1);
for i=1:cellnm,
    if(ismember(i,sp))
        pause;
        E(i)=ener( a1(2),a2(2),a3(2),A0(i),P(i),A(i));
    else
        E(i)=ener( a1(1),a2(1),a3(1),A0(i),P(i),A(i));
    end
%     disp(['E(i)=',num2str(E(i))]);
end
end

