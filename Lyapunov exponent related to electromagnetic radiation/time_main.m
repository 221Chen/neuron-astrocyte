%ϵͳ��Lyapunovָ����2������ʱ��仯������ָ���ס�������ϵͳ����Ӱ��ʱ��ϵͳ���Ǹ������̶�ʱ������ָ���ס���������=��ʱ��Lyapunovָ����
clear
format long
% global k
[T,Res]=lyapunov(4,@Lorenz_LE,@ode45,0,0.01,400,[0 0 2 0],5); %%0-100��ԭ����0.01�����˳�ʼֵ��������֣������ʱ��ı仯����������*0.01�仯,����������ʱ����һ���ġ�0��ʾ������ڲ���ʾʱ�䡣
plot(T,Res,'linewidth',1.2);grid;
xlabel('t');ylabel('Lyapunov index');
legend('LE1','LE2','LE3','LE4');
LE1=mean(Res(:,1)); LE2=mean(Res(:,2)); LE3=mean(Res(:,3)); LE4=mean(Res(:,4));