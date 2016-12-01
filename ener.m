function [ Ui ] = ener( a1,a2,a3,A0u,Piu,Aiu )
%ENER Summary of this function goes here
%   Detailed explanation goes here

A0=A0u*1e-12;
Pi=Piu*1e-6;
Ai=Aiu*1e-12;

lensca=sqrt(A0);
enesca=a3*A0^2;

k=a1/(a3*A0);
twokp0=a2/(a3*A0^1.5);

pii=Pi/lensca;
aii=Ai/A0;

uii=k*pii^2+twokp0*pii+(aii-1)^2;

Ui=uii*enesca;
% disp(['k=',num2str(k),' twokp0=',num2str(twokp0),' A0=',num2str(A0)]);
% disp(['Piu=',num2str(Piu),' Aiu=',num2str(Aiu)]);
% disp(['k*pii^2=',num2str(k*pii^2),' twokp0*pii=',num2str(twokp0*pii),' (aii-1)^2=',num2str((aii-1)^2)]);
% disp(['lensca=',num2str(lensca),' enesca=',num2str(enesca)]);
% disp([' uii=',num2str(uii), ' Ui=',num2str(Ui)]);

% U1=k*pii^2*enesca*2.414324e20;
% U2=twokp0*pii*enesca*2.414324e20;
% U3=(aii-1)^2*enesca*2.414324e20;
% 
% checkU3=a3*(Ai-A0)^2*2.414324e20;
% 
% disp(['aa=',num2str(a3),' A0=',num2str(A0),' Ai=',num2str(Ai)]);
% disp(['U1=',num2str(U1),' U2=',num2str(U2),' U3=',num2str(U3)]);
% disp(['checkU3=',num2str(checkU3)]);

% A0=A00*1e-12;
% Pi=Pii*1e-6;
% Ai=Aii*1e-12;
% Ei=a1*Pi^2+a2*Pi+a3*(Ai-A0)^2;
% disp(['a1*Pi^2=',num2str(a1*Pi^2),' a2*Pi=',num2str(a2*Pi),' a3*(Ai-A0)^2=',num2str(a3*(Ai-A0)^2)]);
end

