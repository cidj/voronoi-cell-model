function [ B ] = difffrom( A )
%DIFFFROM Summary of this function goes here
%   Detailed explanation goes here
% ma=nanmean(A);
% Ai=ones(size(A,1),1)*ma;
% B=(Ai-A).^2;

ma=nanmean(A);
B=((A-ma)./ma).^2;


end

