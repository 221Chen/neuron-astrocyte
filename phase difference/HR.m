function dx=HR(t,x)
dx=zeros(9,1);
k2=2; k3=2;k4=1;k5=0.05;k6=1.5;
I1= 0.2;
k7= 0.5;   k8= 1.4;
k= 1;  km= 1;   m= 40;
mG= exp((m-38)/2);

T1=1/(1+exp(-50*x(1)+10));
T2=1/(1+exp(-50*x(3)+10));
Z=2*T1+2*T2;

dx(1)=x(2)-x(1).^3+3*x(1).^2+I1+k*mG*(x(5))*(x(3)-x(1))-k7*x(8)+km*x(9)*x(1);   % v1 variable 
dx(2)=1-5*x(1).^2-x(2); 

dx(3)=x(3)-x(3)*x(3)*x(3)/3-x(4)+k*mG*(x(6))*(x(1)-x(3))+k8*x(8);                              % v2 variable 
dx(4)=0.1*(x(3)+0.6-0.1*x(4)); 

dx(5)=0.1*T2*(1-x(5))-0.05*x(5);
dx(6)=0.1*T1*(1-x(6))-0.05*x(6);

dx(7)=(1+tanh(Z*mG-k2))*(1-x(7))-k3*x(7);
dx(8)=-k4*x(8)+k5+k6*x(7);

dx(9)=-x(9)+0.5*x(1);