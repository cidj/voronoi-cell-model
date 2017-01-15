function [ ua,up,ura] = simener4( A0,k,p0,AA,PP )
%SIMENER4 Summary of this function goes here
%   Detailed explanation goes here
len=size(AA,1);
AA0=ones(len,1)*A0';
ua=(AA./AA0-1).^2;
up=(PP./sqrt(AA0)-p0).^2;
ura=ua./(ua+k*up);

end

