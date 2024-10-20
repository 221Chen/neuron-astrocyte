clear;
clc;
tic
W1=[];W2=[];
global km
t0=[0 380];%积分时间
y0=[0 0 0 0 0 0 0 0 0];
%bifurcation
for km=0:0.01:2.5 % r的变化精度
    disp(km)
    [T,X]=ode45('HR',t0,y0);  
    data=X(4000:end,1);     %3对应z,2对应y,1对应x.最后ylable相应更改
    for j=2:(length(data)-1)
       if data(j)>data(j-1)&&data(j)>data(j+1)
            plot(km,data(j),'b','linestyle','none','marker','.','markersize',10);
            hold on;   
            if j==20
                break;
            end
       end
    end
    drawnow
end
ylabel('{\itx_{peak}}','FontName', 'times new roman','FontSize',20);
xlabel('{\itk_{m}}','FontName', 'times new roman','FontSize',20);
ylim([0 2])
% grid off;
% axis([6.5 8.8 -15 25]); % 设置坐标轴在指定的区间
toc
 