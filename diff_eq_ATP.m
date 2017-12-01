 function [f] = diff_eq_ATP(~,y,k,x0)
% Started to write on 1.12.2017


% Species: ADP, ATP, LUC, PEP
% Make descriptors and number them for y-vector, so the rate eqns are
% easier on the eye
dADP=1;
dATP=2;
dLUC=3;
dPEP=4;
dAMP=5;

% Species are coupled to y-vector
ADP      = y(dADP);
ATP      = y(dATP);
LUC      = y(dLUC);
PEP      = y(dPEP);
AMP      = y(dAMP);
% c0=ATP+ADP+1e-3;
%Rate equations (Model #3 from the paper)

f(dADP)=2*k.k2*AMP*ATP-k.k3*ADP*PEP;
f(dATP)=-k.k1*ATP*LUC-k.k2*AMP*ATP+k.k3*ADP*PEP;
f(dLUC)=-k.k1*ATP*LUC;
f(dPEP)=-k.k3*ADP*PEP;
f(dAMP)=0;
f=f';
end