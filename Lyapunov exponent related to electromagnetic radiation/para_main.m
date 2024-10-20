%%随系统参数变化时的Lyapunov指数谱
clear
clc
tic
global km
for i=1:1:251
    disp(i)
    km=0.0+0.01*(i-1);                        
[T,Res]=lyapunov(9,@Lorenz_LE,@ode113,0,1,500,[0 0 0 0 0 0 0 0 0],0);  %%初始值需要相应改动。这里注意初始值后面的数字0表示时间t不在命令窗口显示！其含义和随时间变化的那个程序中的一样。0表示在命令窗口不显示时间。
     Lyapunov1(i) = Res(end,1);
     Lyapunov2(i) = Res(end,2);
     Lyapunov3(i) = Res(end,3);
     Lyapunov4(i) = Res(end,4);
end
% LE1=mean(Lyapunov1);    LE2=mean(Lyapunov2);    LE3=mean(Lyapunov3);

cc_val=0.0+0.01*([1:1:251]-1);
plot(cc_val,Lyapunov1(:),'r','linewidth',2);grid on
hold on
plot(cc_val,Lyapunov2(:),'b','linewidth',2);grid on
hold on
% plot(cc_val,Lyapunov3(:),'k','linewidth',1);grid on
% hold on
% plot(cc_val,Lyapunov4(:),'m','linewidth',1);grid on
% hold on
xlabel('{\itk_{m}}');ylabel('\itLEs');
legend('LE1','LE2');
% legend('LE1','LE2','LE3','LE4');
toc

