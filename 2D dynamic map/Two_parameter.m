clear; 
clc;
tic
N1=linspace(0,2,201);
N2=linspace(0,8,401);
nloops=zeros(length(N1),length(N2));
for I=1:length(N1)
    P1=0.01*(I-1);
    parfor L=1:length(N2)
        P2=0.02*(L-1);
        fprintf('P1 = %d, P2 = %d\n',P1,P2);
        nloops(I,L)=CNLE(P1,P2);
        N2(L)=P2;
    end 
    N1(I)=P1;
end
[X,Y]=meshgrid(N1,N2);Z=nloops;
pcolor(X,Y,Z'); % ��α��ͼ
colormap jet,shading interp % �����仯�ı��챥��ɫͼ�����滭α��ͼ
hcb=colorbar;
% set(gca,'ytick',[0:1:10]) %������ɫ������ɫֵ���
% title('Twp-parameter bifurcation')
xlabel('{\it\lambda}_{1}') 
ylabel('{\it\lambda}_{2}') 
% zlabel('�ֲ� {\delta}','FontSize',16)
set(gca,'FontSize',18,'FontName', 'times new roman')
xlim([0,2]); 
ylim([0,8]);
% save data_ab
toc