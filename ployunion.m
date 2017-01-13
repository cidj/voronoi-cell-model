function [ secArr,le ] = ployunion( va,vb )
%PLOYUNION Summary of this function goes here
%   Detailed explanation goes here

% function [ cv ] = ployunion( v1,v2 )
% v1=va_n(vb_n{1},:);
% v2=va_n(vb_n{2},:);

% vv=union(v1,v2,'rows');
% [~,va]=ismember(v1,vv,'rows');
% [~,vb]=ismember(v2,vv,'rows');

% va=[12,1,2,3,4,5,7,8,9,10,11];
% vb=[6,7,5,15,14,13,12,11,10];
% va=[1 2 3 13 12 11 10 9 8];
% vb=[6 7 1 15 9 10 11 14 12 13 3 4 5];
% va=[1 2 3];
% vb=[6 7];

% va=[12,1,2,3,4,5,7,8,9,10,11];
% vb=[6,7,5,15,14,13,12,11,10];

la=length(va);
lb=length(vb);
[~,ia,ib]=intersect(va,vb,'stable');
% lc=length(ia);
iia=perodist([ia(1)-ia(end);diff(ia)],la);
iib=perodist([ib(1)-ib(end);diff(ib)],lb);
mar=union(find(iia~=1),find(iib~=-1));
seca=separr(ia,mar);
secb=separr(ib,mar);
% sec=arr2cells(va,seca);
lensec=length(seca);
le=zeros(lensec,1);
for i=1:lensec,
    le(i)=length(seca{i});
end

secArr=[];
for i=1:lensec,
    secjA=cutarr(seca{i}(end),seca{peris(i+1,lensec)}(1),va,1);
    secjB=cutarr(peris(secb{i}(end)-1,lb),peris(secb{peris(i+1,lensec)}(1)-1,lb),vb,-1);
    secJJ=[secjA,flip(secjB)];
    secArr=[secArr,secJJ,nan];
end
secArr(end)=[];


% secjA=cell(lensec,1);
% secjB=cell(lensec,1);
% secJJ=cell(lensec,1);
% secArr=[];
% for i=1:lensec,
%     secjA{i}=cutarr(seca{i}(end),seca{peris(i+1,lensec)}(1),va,1);
%     secjB{i}=cutarr(peris(secb{i}(end)-1,lb),peris(secb{peris(i+1,lensec)}(1)-1,lb),vb,-1);
%     secJJ{i}=[secjA{i},flip(secjB{i})];
%     secArr=[secArr,secJJ{i},nan];
% end
% secArr(end)=[];


end

