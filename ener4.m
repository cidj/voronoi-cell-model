function [ Ui,U1,U2,U3 ] = ener4( a1,a2,a3,A0u,Piu,Aiu )
%ENER Summary of this function goes here
%   Detailed explanation goes here
beta=2.414324e20;

% A0=A0u*1e-12;
% Pi=Piu*1e-6;
% Ai=Aiu*1e-12;
% lensca=sqrt(A0);
% enesca=a3*A0^2;
% k=a1/(a3*A0);
% twokp0=a2/(a3*A0^1.5);
% pii=Pi/lensca;
% aii=Ai/A0;
% uii=k*pii^2+twokp0*pii+(aii-1)^2;
% Ui=uii*enesca*beta;
% U1=k*pii^2*enesca*beta;
% U2=twokp0*pii*enesca*beta;
% U3=(aii-1)^2*enesca*beta;
%disp(['U1=',num2str(U1),' U2=',num2str(U2),' U3=',num2str(U3)]);
% disp(['k=',num2str(k),' twokp0=',num2str(twokp0),' A0=',num2str(A0)]);
% disp(['Piu=',num2str(Piu),' Aiu=',num2str(Aiu)]);
% disp(['k*pii^2=',num2str(k*pii^2),' twokp0*pii=',num2str(twokp0*pii),' (aii-1)^2=',num2str((aii-1)^2)]);
% disp(['lensca=',num2str(lensca),' enesca=',num2str(enesca)]);
% disp([' uii=',num2str(uii), ' Ui=',num2str(Ui)]);

A0=A0u*1e-12;
Pi=Piu*1e-6;
Ai=Aiu*1e-12;
U1=a1*Pi^2*beta;
U2=a2*Pi*beta;
U3=a3*(Ai-A0)^2*beta;
Ui=U1+U2+U3;
% disp(['U1=',num2str(U1),' U2=',num2str(U2),' U3=',num2str(U3)]);
end

