function [ B ] = finddif( A,B )
%FINDDIF Summary of this function goes here
%   Detailed explanation goes here
% A=roundn(A,-1);
% B=roundn(B,-1);
if(length(A)>length(B))
    error('finddif length error');
end

while 1,
    [A,B,yn]=removeone(A,B);
%     disp(A);
%     disp(B);
    if(~yn)
        if(~isempty(A))
            %             disp(A);
            %             disp(B);
            error('finddif error');
        end
        break;
    end
end



end

