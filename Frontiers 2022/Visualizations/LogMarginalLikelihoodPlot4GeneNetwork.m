%% Old Code
iter0 = 36;
iter1 = 101;
iter2 = 101;%201;%101;%201;%101;%201;%101;%201;%101;%151;
iter3 = 201;
iter4= 251;

% % figure(1);
% % x=1:1:iter2;
% % y=LogMarginalTrain';
% % plot(x,y,'b','LineWidth',2);
% % %xlim([-5 5]);
% % %ylim([ 48]);
% % title("Log Marginal Likelihood Improvemnet")
% % xlabel('Number of Liklihood Function Evaluation')
% % ylabel('Log Marginal Likelihood')
% % grid on
% % %legend('Log Marginal Likelihood');
% % set(gca,'FontSize',12)
% % 
% % 
% % opt = [0 0 -1 0 1 0 -1 -1 0 1 0 0 -1 1 1 0];
% % for i=1:iter2
% % NormC(i,:) = norm(CTrain(i,:) - opt);
% % end
% % 
% % 
% % figure(2);
% % x=1:1:iter2;
% % y=NormC';
% % plot(x,y,'r','LineWidth',2);
% % %xlim([-5 5]);
% % %ylim([ 48]);
% % title("Improvement of the Connectivity Matrix")
% % xlabel('Number of Liklihood Function Evaluation')
% % ylabel('$\left| C_f-C^* \right|$','Interpreter','latex')
% % grid on
% % %legend('Log Marginal Likelihood');
% % set(gca,'FontSize',12)
% % 
% % clc 
% % clear all

% optimalLML = -399.12191274; %dnadsb=0 
% figure(1);
% x=1:1:iter2;
% y=LogMarginalTrain';
% % mostmax = max(LogMarginalTrain)*ones(1,iter2);
% optimalLMLVec = optimalLML*ones(1,iter2);
% plot(x,y,'k','LineWidth',2);
% hold on
% plot(x,optimalLMLVec,'r:','LineWidth',2);
% %xlim([-5 5]);
% %ylim([ 48]);
% title("dna\_dsb = 0")
% xlabel('Number of Liklihood Evaluations')
% ylabel('Log Likelihood')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',14)
% set(gca,'LineWidth',1)
% box on

% maxLML = LogMarginalTrain(1,1);
% for i = 2:iter2
%     if LogMarginalTrain(i,1)>maxLML(i-1,1)
%         maxLML(i,1) = LogMarginalTrain(i,1);
%     else
%         maxLML(i,1) = maxLML(i-1,1);
%     end    
% end
% 
% figure(2);
% x=1:1:iter2;
% y=maxLML';
% plot(x,y,'b','LineWidth',2);
% title("Log Marginal Likelihood Improvemnet")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('$max(LML_t)$','Interpreter','latex')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)
% 

% opt = [0 0 -1 0 1 0 -1 -1 0 1 0 0 -1 1 1 0];
opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];
for i=1:iter2
NormC(i,:) = norm((CTrain(i,:) - opt),1);
end
% 
% 
% figure(3);
% x=1:1:iter2;
% y=NormC';
% plot(x,y,'r','LineWidth',2);
% %xlim([-5 5]);
% %ylim([ 48]);
% title("Improvement of the Connectivity Matrix")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('$\left| C_f-C^* \right|$','Interpreter','latex')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)
% 
minError = NormC(1,1);
for i = 2:iter2
    if NormC(i,1)<minError(i-1,1)
        minError(i,1) = NormC(i,1);
    else
        minError(i,1) = minError(i-1,1);
    end    
end

figure(1);
x=1:1:iter2;
y=minError';

minY = min(y);
maxY = max(y);

plot(x,y,'k','LineWidth',2);
% title("dna\_dsb = 0")
xlabel('Number of Likelihood Evaluations')
ylabel('Connectivity Error')
grid on
lgnd2 = legend('Proposed Method', 'Location', 'northeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

xlim([0.75, iter2+1])

% xlim([0.05, iter2+0.75])

% xlim([0.75, iter2+1.5])

%ylim([-404, -394])
% ylim([minY-1, maxY+0.5])
ylim([0-0.5, 16+0.5])
yticks(-1 : 17)
box on


% clc 
% clear all

%% New Code

% iter0 = 36;
% iter1 = 101;
% iter2 = 151;
% iter3 = 201;
% iter4 = 251;
% iter5 = 251;%101;%201;%101;%201;%101;%37;%201;%51; 361
% 
% figure(1);
% x=1:1:iter5;
% y=LogMarginalTrain';
% mostmax = max(LogMarginalTrain)*ones(1,iter5);
% plot(x,y,'b','LineWidth',2);
% hold on
% plot(x,mostmax,'r--','LineWidth',2);
% %xlim([-5 5]);
% %ylim([ 48]);
% title("Log Marginal Likelihood Improvemnet")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('Log Marginal Likelihood')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)
% 
% maxLML = LogMarginalTrain(1,1);
% for i = 2:iter5
%     if LogMarginalTrain(i,1)>maxLML(i-1,1)
%         maxLML(i,1) = LogMarginalTrain(i,1);
%     else
%         maxLML(i,1) = maxLML(i-1,1);
%     end    
% end
% 
% figure(2);
% x=1:1:iter5;
% y=maxLML';
% plot(x,y,'b','LineWidth',2);
% title("Log Marginal Likelihood Improvemnet")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('$max(LML_t)$','Interpreter','latex')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)
% 
% opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];
% for i=1:iter5
% NormC(i,:) = norm(CTrain(i,:) - opt);
% end
% 
% 
% figure(3);
% x=1:1:iter5;
% y=NormC';
% plot(x,y,'r','LineWidth',2);
% %xlim([-5 5]);
% %ylim([ 48]);
% title("Improvement of the Connectivity Matrix")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('$\left| C_f-C^* \right|$','Interpreter','latex')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)
% 
% minError = NormC(1,1);
% for i = 2:iter5
%     if NormC(i,1)<minError(i-1,1)
%         minError(i,1) = NormC(i,1);
%     else
%         minError(i,1) = minError(i-1,1);
%     end    
% end
% 
% figure(4);
% x=1:1:iter5;
% y=minError';
% plot(x,y,'r','LineWidth',2);
% title("Improvement of the Connectivity Matrix")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('$min(C^{true}-argmax(\mu^t_{GP}))$','Interpreter','latex')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)
% 
% 
% % clc 
% % clear all