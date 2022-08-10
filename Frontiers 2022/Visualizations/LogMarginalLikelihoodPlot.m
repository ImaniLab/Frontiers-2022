% %% Old Code
% iter0 = 36;
% iter1 = 101;
% iter2 = 151;
% iter3 = 201;
% iter4= 251;
% 
% % % figure(1);
% % % x=1:1:iter2;
% % % y=LogMarginalTrain';
% % % plot(x,y,'b','LineWidth',2);
% % % %xlim([-5 5]);
% % % %ylim([ 48]);
% % % title("Log Marginal Likelihood Improvemnet")
% % % xlabel('Number of Liklihood Function Evaluation')
% % % ylabel('Log Marginal Likelihood')
% % % grid on
% % % %legend('Log Marginal Likelihood');
% % % set(gca,'FontSize',12)
% % % 
% % % 
% % % opt = [0 0 -1 0 1 0 -1 -1 0 1 0 0 -1 1 1 0];
% % % for i=1:iter2
% % % NormC(i,:) = norm(CTrain(i,:) - opt);
% % % end
% % % 
% % % 
% % % figure(2);
% % % x=1:1:iter2;
% % % y=NormC';
% % % plot(x,y,'r','LineWidth',2);
% % % %xlim([-5 5]);
% % % %ylim([ 48]);
% % % title("Improvement of the Connectivity Matrix")
% % % xlabel('Number of Liklihood Function Evaluation')
% % % ylabel('$\left| C_f-C^* \right|$','Interpreter','latex')
% % % grid on
% % % %legend('Log Marginal Likelihood');
% % % set(gca,'FontSize',12)
% % % 
% % % clc 
% % % clear all
% 
% figure(1);
% x=1:1:iter2;
% y=LogMarginalTrain';
% mostmax = max(LogMarginalTrain)*ones(1,iter2);
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
% for i=1:iter2
% NormC(i,:) = norm(CTrain(i,:) - opt);
% end
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
% minError = NormC(1,1);
% for i = 2:iter2
%     if NormC(i,1)<minError(i-1,1)
%         minError(i,1) = NormC(i,1);
%     else
%         minError(i,1) = minError(i-1,1);
%     end    
% end
% 
% figure(4);
% x=1:1:iter2;
% y=minError';
% plot(x,y,'r','LineWidth',2);
% title("Improvement of the Connectivity Matrix")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('$min(C^{true}-argmax(\mu^t_{GP}))$','Interpreter','latex')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)
% 
% % clc 
% % clear all

%% New Code

iter0 = 36;
iter1 = 101;
iter2 = 151;
iter3 = 201;
iter4 = 251;
iter5 = 251;%101;%201;%101;%201;%101;%37;%201;%51; 361

figure(1);
x=1:1:iter5;
y=LogMarginalTrain';
mostmax = max(LogMarginalTrain)*ones(1,iter5);
plot(x,y,'b','LineWidth',2);
hold on
plot(x,mostmax,'r--','LineWidth',2);
%xlim([-5 5]);
%ylim([ 48]);
title("Log Marginal Likelihood Improvemnet")
xlabel('Number of Liklihood Function Evaluation')
ylabel('Log Marginal Likelihood')
grid on
%legend('Log Marginal Likelihood');
set(gca,'FontSize',12)

maxLML = LogMarginalTrain(1,1);
for i = 2:iter5
    if LogMarginalTrain(i,1)>maxLML(i-1,1)
        maxLML(i,1) = LogMarginalTrain(i,1);
    else
        maxLML(i,1) = maxLML(i-1,1);
    end    
end

figure(2);
x=1:1:iter5;
y=maxLML';
plot(x,y,'b','LineWidth',2);
title("Log Marginal Likelihood Improvemnet")
xlabel('Number of Liklihood Function Evaluation')
ylabel('$max(LML_t)$','Interpreter','latex')
grid on
%legend('Log Marginal Likelihood');
set(gca,'FontSize',12)

opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];
for i=1:iter5
NormC(i,:) = norm(CTrain(i,:) - opt);
end


figure(3);
x=1:1:iter5;
y=NormC';
plot(x,y,'r','LineWidth',2);
%xlim([-5 5]);
%ylim([ 48]);
title("Improvement of the Connectivity Matrix")
xlabel('Number of Liklihood Function Evaluation')
ylabel('$\left| C_f-C^* \right|$','Interpreter','latex')
grid on
%legend('Log Marginal Likelihood');
set(gca,'FontSize',12)

minError = NormC(1,1);
for i = 2:iter5
    if NormC(i,1)<minError(i-1,1)
        minError(i,1) = NormC(i,1);
    else
        minError(i,1) = minError(i-1,1);
    end    
end

figure(4);
x=1:1:iter5;
y=minError';
plot(x,y,'r','LineWidth',2);
title("Improvement of the Connectivity Matrix")
xlabel('Number of Liklihood Function Evaluation')
ylabel('$min(C^{true}-argmax(\mu^t_{GP}))$','Interpreter','latex')
grid on
%legend('Log Marginal Likelihood');
set(gca,'FontSize',12)


% clc 
% clear all