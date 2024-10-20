%系统的Lyapunov指数谱2——随时间变化的李氏指数谱。（考虑系统参数影响时，系统的那个参数固定时的李氏指数谱。即：（）=？时的Lyapunov指数。
clear
format long
% global k
[T,Res]=lyapunov(4,@Lorenz_LE,@ode45,0,0.01,400,[0 0 2 0],5); %%0-100，原步长0.01，有了初始值后面的数字，命令窗口时间的变化按就是数字*0.01变化,但是总运行时间是一定的。0表示在命令窗口不显示时间。
plot(T,Res,'linewidth',1.2);grid;
xlabel('t');ylabel('Lyapunov index');
legend('LE1','LE2','LE3','LE4');
LE1=mean(Res(:,1)); LE2=mean(Res(:,2)); LE3=mean(Res(:,3)); LE4=mean(Res(:,4));