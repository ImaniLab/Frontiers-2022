black = [0,0,0];
darkblue = [0 0.4470 0.7410];
darkred = [0.6350 0.0780 0.1840];
darkgreen = [0.4660 0.6740 0.1880];
darkyellow = [0.9290 0.6940 0.1250];
darkcyan = [0.3010 0.7450 0.9330];

t = 1:260;%510;%1:510;%1:260;

z = 1;

% for i=1:26%51%26
%     for j=1:10
%         Progress(z) = LMLReport(i);
%         z = z + 1;
%     end
% end
% 
% Progress = -1*Progress;

% figure(1);
% plot(t,Progress,'g','LineWidth',2);
% title("Improvement of the LML")
% xlabel('Number of Liklihood Function Evaluation')
% ylabel('$max(LML_t)$','Interpreter','latex')
% grid on
% %legend('Log Marginal Likelihood');
% set(gca,'FontSize',12)

iter = 101;%201;%101;%201;%101;%251;%101;%201;%101;%201;%101;%37;%201;%51; 361

maxLML = LogMarginalTrain(1,1);
for i = 2:iter
    if LogMarginalTrain(i,1)>maxLML(i-1,1)
        maxLML(i,1) = LogMarginalTrain(i,1);
    else
        maxLML(i,1) = maxLML(i-1,1);
    end    
end

x=1:1:iter;
y=maxLML';

optimalLML =  -31 %-91.89975769; %dnadsb=0 
% optimalLML =  -382.6372; %dnadsb=1
optimalLMLVec = optimalLML*ones(1,iter);

minY = min(maxLML);
maxY = max(maxLML);

figure(1);
plot(x,y,'k','LineWidth',2);
hold on
%plot(t(1:iter),Progress(1:iter), 'Color',darkblue,'LineStyle','--','LineWidth',2);
%plot(t(1:101),Progress(1:101), 'Color',darkblue,'LineStyle','--','LineWidth',2);
hold on
plot(x,optimalLMLVec,'r:','LineWidth',2);
% title("dna\_dsb = 0")
xlabel('Number of Likelihood Evaluations')
ylabel('Maximum Log-Likelihood ')
grid on
lgnd2 = legend('Proposed Method', 'Optimal Log-Likelihood', 'Location', 'southeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')
% xlim([0.85, iter+1.5]) % dnadsb=0 16unknown
% xlim([0.2, iter+1.5]) % dnadsb=1 16unknown
xlim([0.7, iter+0.5])  %10gene 10unknown
%ylim([-404, -394])
% ylim([minY-0.5, maxY+0.5]) %dnadsb=0 8unknown
% ylim([minY-1.7, maxY+0.2]) %dnadsb=0 16unknown
% ylim([minY-1, maxY+0.75]) %dnadsb=1 16unknown
% ylim([minY-0.5, maxY+1]) %dnadsb=1 8 unknowns
ylim([minY-0.5, -30])%maxY+0.5]) %10gene 10unknown
box on
