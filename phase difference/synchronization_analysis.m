%分析同步行为
clc
clear
t0=0:0.01:1000; 
x0=[0 0 0 0 0 0 0 0 0]; 
options=odeset('RelTol',1e-6,'AbsTol',1e-6);
[t,Y]=ode45(@HR,t0,x0,options);

%% 时序图
% figure();        
% plot(t(1:end),Y(1:end,1),'r','linewidth',2); % 状态变量x的时序图
% hold on
% plot(t(1:end),Y(1:end,3),'b','linewidth',2); % 状态变量x的时序图
% xlabel('\itt','fontsize',20,'fontname','times new roman','FontAngle','normal');
% ylabel('{\itx}_{1}, {\itx}_{2}','fontsize',20,'fontname','times new roman','FontAngle','normal');
% hold on
%% 计算相位及相位差
phi_x=ph(Y(:,1));
phi_u=ph(Y(:,3));
phi_diff=(abs(phi_u-phi_x+0*pi));

figure()
plot(t,phi_diff,'m','linewidth',2);
xlabel('\itt');
ylabel('\it\Delta\theta(t)');
% ylim([0,7]);
hold on
%% 输出误差
% D=(Y(:,1)-Y(:,3)).^2;
% D1=1.*sqrt(D);
% 
% figure()
% plot(t,D1,'k','linewidth',1.5)
% xlabel('\itt');
% ylabel('\it\Delta d');
% hold on
%% 误差方程
% x1=Y(:,1);  y1=Y(:,2);  x2=Y(:,3);  y2=Y(:,4);
% ex=(x1-x2).^2;  ey=(y1-y2).^2;
% error=1.*sqrt(ex+ey);
% 
% figure()
% plot(t,error,'k','linewidth',2)
% xlabel('\itt');
% ylabel('\theta');
% hold on