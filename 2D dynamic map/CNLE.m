%统计局部极值个数
function type=CNLE(a,b)
% SrottC(alpha, bet) 
% computes the solution to the SrottC system, draws the trajectory over time
% and in the x(1)-x(2) phase space and writes an png image.

% if nargin == 0   %没有参数输入则随机产生参数
%    xi = rand(2,1);
%    a = round(875*xi(1) + 1350*(1-xi(1)))/1000;
%    b   = round(530*xi(2) + 955*(1-xi(2)))/1000;
% end   

% a=0.78;
% b=0.9; 
x = [0 0 0 0 0 0 0 0 0]; %初始值

% lab = sprintf('%5.3f,%5.3f', a, a); %打印两个参数
% fprintf('a, b %s \n',lab)
% fprintf('integrating transient phase\n')
opt = odeset('AbsTol',1e-9,'RelTol',1e-9); %设置精度
r = ode45(@(t,x)f(t,x,a,b), [0,380], x, opt);  %解方程
x = r.y(:,end);
% opt = odeset('AbsTol',1e-9,'RelTol',1e-9);
% r = ode45(@(t,x)f(t,x,a,b), [0,500], x, opt);
% x = r.y(:,end);

% fprintf('integrating second phase, with new inital\n')

opt = odeset('AbsTol',1e-9,'RelTol',1e-9, ...
             'Events',@(t,x)events(t,x,a,b));
r = ode45(@(t,x)f(t,x,a,b), [0,380], x, opt);

nloops = inf; delta = inf;
for k = 2:min(length(r.xe),50)
   delta = min(delta, norm(r.ye(:,1)-r.ye(:,k)));
   if delta< 2e-3
      nloops = k -1;
      break
   end 
end

if nloops>0 && nloops< 16  %周期态
    type = nloops;
else
    type = 17;  %大于16意味着混沌态
end
% fprintf('periodic orbit, loops %g, delta %g \n', nloops, delta)
% 
% clf
% subplot(1,2,1)
% plot(r.x,r.y(1,:))
% title(lab)
% hold on
% plot(r.xe, r.ye(1,:),'ro')
% subplot(1,2,2)
% plot(r.y(1,:),r.y(2,:))
% hold on
% plot(r.ye(1,:),r.ye(2,:),'ro')
% title([num2str(nloops),' loops'])
% print('-dpng','-r100',[lab,'.png'])