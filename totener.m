function [ totE ] = totener( sp,a1,a2,a3,A0,P,A )
%TOTENER Summary of this function goes here
%   Detailed explanation goes here
E= cellener(sp,a1,a2,a3,A0,P,A);
totE=sum(E);
% disp(['totE=',num2str(totE)]);
end

