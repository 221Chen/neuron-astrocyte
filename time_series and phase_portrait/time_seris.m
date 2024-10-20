clear
clc
tspan=0:0.01:800;
Y0=[0 0 0 0 0 0 0 0 0];
[t,y]= ode45('HR',tspan,Y0);
n=length(t);
n1=round(n/2); 

%% ��ͼ
figure();
plot(y(40000:n,3),y(40000:n,1),'r','linewidth',2);
xlabel('{\itx}_{2}');
ylabel('{\itx}_{1}');
hold on
%% ʱ��ͼ
figure();        
plot(t(40001:end),y(40001:end,1),'r','linewidth',2); % ״̬����x��ʱ��ͼ
hold on
plot(t(40001:end),y(40001:end,3),'b','linewidth',2); % ״̬����x��ʱ��ͼ
xlabel('\itt','fontsize',20,'fontname','times new roman','FontAngle','normal');
ylabel('{\itx}_{1}, {\itx}_{2}','fontsize',20,'fontname','times new roman','FontAngle','normal');
hold on