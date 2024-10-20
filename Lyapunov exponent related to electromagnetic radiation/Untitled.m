clc
clear
syms x1 x2 y1 y2 g1 g2 q p phi Z km T1 T2 k7 k8 k
k3=2;k4=1;k5=0.05;k6=1.5;I1=0.2;
T1=1/(1+exp(-50*x1+10));
T2=1/(1+exp(-50*x2+10));
Z=2*T1+2*T2;

fx1=y1-x1^3+3*x1^2+I1+k*(x2-x1)*g1-k7*p+km*phi*x1;
fy1=1-5*x1^2-y1;
fx2=x2-(x2^3)/3-y2+k*(x1-x2)*g2+k8*p;
fy2=0.1*(x2+0.6-0.1*y2);
fg1=0.1*T2*(1-g1)-0.05*g1;
fg2=0.1*T1*(1-g2)-0.05*g2;
fq=(1+tanh(Z-2))*(1-q)-k3*q;
fp=-k4*p+k5+k6*q;
fphi=-phi+0.5*x1;

diff(fp,x1)