t = 1:510;%1:510;%1:260;

z = 1;

for i=1:51%51%26
    for j=1:10
        Progress(z) = LMLReport(i);
        z = z + 1;
    end
end

Progress = -1*Progress;

figure(1);
plot(t,Progress,'g','LineWidth',2);
title("Improvement of the LML")
xlabel('Number of Liklihood Function Evaluation')
ylabel('$max(LML_t)$','Interpreter','latex')
grid on
%legend('Log Marginal Likelihood');
set(gca,'FontSize',12)

iter5 = 251;%101;%201;%101;%201;%101;%37;%201;%51; 361

maxLML = LogMarginalTrain(1,1);
for i = 2:iter5
    if LogMarginalTrain(i,1)>maxLML(i-1,1)
        maxLML(i,1) = LogMarginalTrain(i,1);
    else
        maxLML(i,1) = maxLML(i-1,1);
    end    
end

x=1:1:iter5;
y=maxLML';

figure(2);
plot(t(1:251),Progress(1:251),'g','LineWidth',2);
%plot(t(1:101),Progress(1:101),'g','LineWidth',2);
hold on
plot(x,y,'b','LineWidth',2);
plot(x(1:101),y(1:101),'b','LineWidth',2);
title("Log Marginal Likelihood Improvemnet")
xlabel('Number of Liklihood Function Evaluation')
ylabel('$max(LML_t)$','Interpreter','latex')
grid on
lgnd2 = legend('Only GA', 'Only BO');
set(gca,'FontSize',12)
% set(lgnd2,'color','none','Box', 'off');