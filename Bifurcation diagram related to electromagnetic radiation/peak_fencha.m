clear;
clc;
tic
W1=[];W2=[];
global km
t0=[0 380];%����ʱ��
y0=[0 0 0 0 0 0 0 0 0];
%bifurcation
for km=0:0.01:2.5 % r�ı仯����
    disp(km)
    [T,X]=ode45('HR',t0,y0);  
    data=X(4000:end,1);     %3��Ӧz,2��Ӧy,1��Ӧx.���ylable��Ӧ����
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
% axis([6.5 8.8 -15 25]); % ������������ָ��������
toc
 