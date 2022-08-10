% x = 1:100;                                          % Create Independent Variable
% y = randn(50,100);                                  % Create Dependent Variable ‘Experiments’ Data
% N = size(y,1);                                      % Number of ‘Experiments’ In Data Set
% yMean = mean(y);                                    % Mean Of All Experiments At Each Value Of ‘x’
% ySEM = std(y)/sqrt(N);                              % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
% CI95 = tinv([0.025 0.975], N-1);                    % Calculate 95% Probability Intervals Of t-Distribution
% yCI95 = bsxfun(@times, ySEM, CI95(:));              % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’
% figure
% plot(x, yMean)                                      % Plot Mean Of All Experiments
% hold on
% plot(x, yCI95+yMean)                                % Plot 95% Confidence Intervals Of All Experiments
% hold off
% grid

% x = 1:100;                                          % Create Independent Variable
% y = randn(50,100);                                  % Create Dependent Variable ‘Experiments’ Data
% N = size(y,1);                                      % Number of ‘Experiments’ In Data Set
% yMean = mean(y);                                    % Mean Of All Experiments At Each Value Of ‘x’
% ySEM = std(y)/sqrt(N);                              % Compute ‘Standard Error Of The Mean’ Of All Experiments At Each Value Of ‘x’
% CI95 = tinv([0.025 0.975], N-1);                    % Calculate 95% Probability Intervals Of t-Distribution
% yCI95 = bsxfun(@times, ySEM, CI95(:));              % Calculate 95% Confidence Intervals Of All Experiments At Each Value Of ‘x’
% figure
% plot(x, yMean,'p')                                  % Plot Mean Of All Experiments
% hold on
% % plot(x, yCI95+yMean,'-r')                           % Plot 95% Confidence Intervals Of All Experiments
% patch([x, fliplr(x)], [yCI95(1,:) fliplr(yCI95(2,:))], 'b', 'EdgeColor','none', 'FaceAlpha',0.25)
% hold off
% grid

black = [0,0,0];
darkblue = [0 0.4470 0.7410];
darkred = [0.6350 0.0780 0.1840];
darkgreen = [0.4660 0.6740 0.1880];
darkyellow = [0.9290 0.6940 0.1250];
darkcyan = [0.3010 0.7450 0.9330];

iter = 101;

maxLML1 = LogMarginalTrain1(1,1);
for i = 2:iter
    if LogMarginalTrain1(i,1)>maxLML1(i-1,1)
        maxLML1(i,1) = LogMarginalTrain1(i,1);
    else
        maxLML1(i,1) = maxLML1(i-1,1);
    end    
end

maxLML2 = LogMarginalTrain2(1,1);
for i = 2:iter
    if LogMarginalTrain2(i,1)>maxLML2(i-1,1)
        maxLML2(i,1) = LogMarginalTrain2(i,1);
    else
        maxLML2(i,1) = maxLML2(i-1,1);
    end    
end

maxLML3 = LogMarginalTrain3(1,1);
for i = 2:iter
    if LogMarginalTrain3(i,1)>maxLML3(i-1,1)
        maxLML3(i,1) = LogMarginalTrain3(i,1);
    else
        maxLML3(i,1) = maxLML3(i-1,1);
    end    
end

maxLML4 = LogMarginalTrain4(1,1);
for i = 2:iter
    if LogMarginalTrain4(i,1)>maxLML4(i-1,1)
        maxLML4(i,1) = LogMarginalTrain4(i,1);
    else
        maxLML4(i,1) = maxLML4(i-1,1);
    end    
end

maxLML5 = LogMarginalTrain5(1,1);
for i = 2:iter
    if LogMarginalTrain5(i,1)>maxLML5(i-1,1)
        maxLML5(i,1) = LogMarginalTrain5(i,1);
    else
        maxLML5(i,1) = maxLML5(i-1,1);
    end    
end

maxLML6 = LogMarginalTrain6(1,1);
for i = 2:iter
    if LogMarginalTrain6(i,1)>maxLML6(i-1,1)
        maxLML6(i,1) = LogMarginalTrain6(i,1);
    else
        maxLML6(i,1) = maxLML6(i-1,1);
    end    
end

maxLML7 = LogMarginalTrain7(1,1);
for i = 2:iter
    if LogMarginalTrain7(i,1)>maxLML7(i-1,1)
        maxLML7(i,1) = LogMarginalTrain7(i,1);
    else
        maxLML7(i,1) = maxLML7(i-1,1);
    end    
end

maxLML8 = LogMarginalTrain8(1,1);
for i = 2:iter
    if LogMarginalTrain8(i,1)>maxLML8(i-1,1)
        maxLML8(i,1) = LogMarginalTrain8(i,1);
    else
        maxLML8(i,1) = maxLML8(i-1,1);
    end    
end

maxLML9 = LogMarginalTrain9(1,1);
for i = 2:iter
    if LogMarginalTrain9(i,1)>maxLML9(i-1,1)
        maxLML9(i,1) = LogMarginalTrain9(i,1);
    else
        maxLML9(i,1) = maxLML9(i-1,1);
    end    
end

maxLML10 = LogMarginalTrain10(1,1);
for i = 2:iter
    if LogMarginalTrain10(i,1)>maxLML10(i-1,1)
        maxLML10(i,1) = LogMarginalTrain10(i,1);
    else
        maxLML10(i,1) = maxLML10(i-1,1);
    end    
end

for i=1:101
    maxLMLMean(i) = (maxLML1(i)+maxLML2(i)+maxLML3(i)+maxLML4(i)+maxLML5(i)+maxLML6(i)+maxLML7(i)+maxLML8(i)+maxLML9(i)+maxLML10(i))/10;
end

for i=1:101
    maxLMLSTD(i) = sqrt(((maxLMLMean(i)-maxLML1(i))^2+(maxLMLMean(i)-maxLML2(i))^2+(maxLMLMean(i)-maxLML3(i))^2+(maxLMLMean(i)-maxLML4(i))^2+(maxLMLMean(i)-maxLML5(i))^2+(maxLMLMean(i)-maxLML6(i))^2+(maxLMLMean(i)-maxLML7(i))^2+(maxLMLMean(i)-maxLML8(i))^2+(maxLMLMean(i)-maxLML9(i))^2+(maxLMLMean(i)-maxLML10(i))^2)/10);
end

% test standard error of the mean
  %%%%%%maxLMLSTD = maxLMLSTD/sqrt(10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
z = 1;
for i=1:26
    for j=1:10
        Progress1(z) = LMLReport1(i);
        z = z + 1;
    end
end
Progress1 = -1*Progress1;

z = 1;
for i=1:26
    for j=1:10
        Progress2(z) = LMLReport2(i);
        z = z + 1;
    end
end
Progress2 = -1*Progress2;

z = 1;
for i=1:26
    for j=1:10
        Progress3(z) = LMLReport3(i);
        z = z + 1;
    end
end
Progress3 = -1*Progress3;

z = 1;
for i=1:26
    for j=1:10
        Progress4(z) = LMLReport4(i);
        z = z + 1;
    end
end
Progress4 = -1*Progress4;

z = 1;
for i=1:26
    for j=1:10
        Progress5(z) = LMLReport5(i);
        z = z + 1;
    end
end
Progress5 = -1*Progress5;

z = 1;
for i=1:26
    for j=1:10
        Progress6(z) = LMLReport6(i);
        z = z + 1;
    end
end
Progress6 = -1*Progress6;

z = 1;
for i=1:26
    for j=1:10
        Progress7(z) = LMLReport7(i);
        z = z + 1;
    end
end
Progress7 = -1*Progress7;

z = 1;
for i=1:26
    for j=1:10
        Progress8(z) = LMLReport8(i);
        z = z + 1;
    end
end
Progress8 = -1*Progress8;

z = 1;
for i=1:26
    for j=1:10
        Progress9(z) = LMLReport9(i);
        z = z + 1;
    end
end
Progress9 = -1*Progress9;

z = 1;
for i=1:26
    for j=1:10
        Progress10(z) = LMLReport10(i);
        z = z + 1;
    end
end
Progress10 = -1*Progress10;

for i=1:101
    GAMean(i) = (Progress1(i)+Progress2(i)+Progress3(i)+Progress4(i)+Progress5(i)+Progress6(i)+Progress7(i)+Progress8(i)+Progress9(i)+Progress10(i))/10;
end

for i=1:101
    GASTD(i) = sqrt(((GAMean(i)-Progress1(i))^2+(GAMean(i)-Progress2(i))^2+(GAMean(i)-Progress3(i))^2+(GAMean(i)-Progress4(i))^2+(GAMean(i)-Progress5(i))^2+(GAMean(i)-Progress6(i))^2+(GAMean(i)-Progress7(i))^2+(GAMean(i)-Progress8(i))^2+(GAMean(i)-Progress9(i))^2+(GAMean(i)-Progress10(i))^2)/10);
end

% test standard error of the mean
 %%%%%%GASTD = GASTD/sqrt(10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];

for i=1:iter
NormC1(i,:) = norm((CTrain1(i,:) - opt),1);
end
minError1 = NormC1(1,1);
for i = 2:iter
    if NormC1(i,1)<minError1(i-1,1)
        minError1(i,1) = NormC1(i,1);
    else
        minError1(i,1) = minError1(i-1,1);
    end    
end

for i=1:iter
NormC2(i,:) = norm((CTrain2(i,:) - opt),1);
end
minError2 = NormC2(1,1);
for i = 2:iter
    if NormC2(i,1)<minError2(i-1,1)
        minError2(i,1) = NormC2(i,1);
    else
        minError2(i,1) = minError2(i-1,1);
    end    
end

for i=1:iter
NormC3(i,:) = norm((CTrain3(i,:) - opt),1);
end
minError3 = NormC3(1,1);
for i = 2:iter
    if NormC3(i,1)<minError3(i-1,1)
        minError3(i,1) = NormC3(i,1);
    else
        minError3(i,1) = minError3(i-1,1);
    end    
end

for i=1:iter
NormC4(i,:) = norm((CTrain4(i,:) - opt),1);
end
minError4 = NormC4(1,1);
for i = 2:iter
    if NormC4(i,1)<minError4(i-1,1)
        minError4(i,1) = NormC4(i,1);
    else
        minError4(i,1) = minError4(i-1,1);
    end    
end

for i=1:iter
NormC5(i,:) = norm((CTrain5(i,:) - opt),1);
end
minError5 = NormC5(1,1);
for i = 2:iter
    if NormC5(i,1)<minError5(i-1,1)
        minError5(i,1) = NormC5(i,1);
    else
        minError5(i,1) = minError5(i-1,1);
    end    
end

for i=1:iter
NormC6(i,:) = norm((CTrain6(i,:) - opt),1);
end
minError6 = NormC6(1,1);
for i = 2:iter
    if NormC6(i,1)<minError6(i-1,1)
        minError6(i,1) = NormC6(i,1);
    else
        minError6(i,1) = minError6(i-1,1);
    end    
end

for i=1:iter
NormC7(i,:) = norm((CTrain7(i,:) - opt),1);
end
minError7 = NormC7(1,1);
for i = 2:iter
    if NormC7(i,1)<minError7(i-1,1)
        minError7(i,1) = NormC7(i,1);
    else
        minError7(i,1) = minError7(i-1,1);
    end    
end

for i=1:iter
NormC8(i,:) = norm((CTrain8(i,:) - opt),1);
end
minError8 = NormC8(1,1);
for i = 2:iter
    if NormC8(i,1)<minError8(i-1,1)
        minError8(i,1) = NormC8(i,1);
    else
        minError8(i,1) = minError8(i-1,1);
    end    
end

for i=1:iter
NormC9(i,:) = norm((CTrain9(i,:) - opt),1);
end
minError9 = NormC9(1,1);
for i = 2:iter
    if NormC9(i,1)<minError9(i-1,1)
        minError9(i,1) = NormC9(i,1);
    else
        minError9(i,1) = minError9(i-1,1);
    end    
end

for i=1:iter
NormC10(i,:) = norm((CTrain10(i,:) - opt),1);
end
minError10 = NormC10(1,1);
for i = 2:iter
    if NormC10(i,1)<minError10(i-1,1)
        minError10(i,1) = NormC10(i,1);
    else
        minError10(i,1) = minError10(i-1,1);
    end    
end

for i=1:101
    CEMean(i) = (minError1(i)+minError2(i)+minError3(i)+minError4(i)+minError5(i)+minError6(i)+minError7(i)+minError8(i)+minError9(i)+minError10(i))/10;
end

for i=1:101
    CESTD(i) = sqrt(((CEMean(i)-minError1(i))^2+(CEMean(i)-minError2(i))^2+(CEMean(i)-minError3(i))^2+(CEMean(i)-minError4(i))^2+(CEMean(i)-minError5(i))^2+(CEMean(i)-minError6(i))^2+(CEMean(i)-minError7(i))^2+(CEMean(i)-minError8(i))^2+(CEMean(i)-minError9(i))^2+(CEMean(i)-minError10(i))^2)/10);
end

% test standard error of the mean
%%%%%%CESTD = CESTD/sqrt(10);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = 1:iter;                     
xGA = 11:iter+10;

xconf = [x x(end:-1:1)] ;         
yconf = [maxLMLMean+1.96*maxLMLSTD maxLMLMean(end:-1:1)-1.96*maxLMLSTD(end:-1:1)]; %(end:-1:1)

xconfGA = [xGA xGA(end:-1:1)] ;         
yconfGA = [GAMean+1.96*GASTD GAMean(end:-1:1)-1.96*GASTD(end:-1:1)]; %(end:-1:1)

yconfCE = [CEMean+1.96*CESTD CEMean(end:-1:1)-1.96*CESTD(end:-1:1)]; %(end:-1:1)

% figure
% p = fill(xconf,yconf,'red');
% p.FaceColor = [1 0.8 0.8];      
% p.EdgeColor = 'none';           
% 
% hold on
% plot(x,maxLMLMean,'r-')
% hold off

optimalLML =  -91.89975769 %-91.758432200705660; %should be:-91.89975769, was changed for ML report  %-91.89975769; %dnadsb=0 
% optimalLML =  -382.6372; %dnadsb=1
optimalLMLVec = optimalLML*ones(1,iter);

% minY = min(maxLML);
% maxY = max(maxLML);

figure(1);
% plot(x,maxLMLMean,'Color', darkblue,'LineWidth',2);
% hold on
p = fill(xconf,yconf,'blue');
p.FaceColor = [0.8, 0.901, 1];       
p.EdgeColor = [0.8, 0.8, 1];  
p.FaceAlpha = 0.8;
hold on
q=plot(x,maxLMLMean,'Color', darkblue,'LineWidth',2);
%plot(t(1:iter),Progress(1:iter), 'Color',darkblue,'LineStyle','--','LineWidth',2);
%plot(t(1:101),Progress(1:101), 'Color',darkblue,'LineStyle','--','LineWidth',2);
% hold on
% title("dna\_dsb = 0")

hold on
% r=plot(xGA,GAMean,'Color', darkred,'LineWidth',2,'LineStyle','-.');
% hold on
r = fill(xconfGA,yconfGA,'red');
r.FaceColor = [1 0.8 0.8];      
r.EdgeColor = [1 0.8 0.9];
r.FaceAlpha = 0.5;
hold on
s=plot(xGA,GAMean,'Color', darkred,'LineWidth',2,'LineStyle','-.');

hold on
t=plot(x,optimalLMLVec,'r:','LineWidth',2);

xlabel('Number of Likelihood Evaluations')
ylabel('Maximum Log-Likelihood ')
grid on
lgnd2 = legend([q,p,s,r,t],["Proposed Method Mean","95% Confidence Interval","GA Method Mean","GA 95% Confidence Interval", "Optimal Log-Likelihood"], 'Location', 'northoutside');
lgnd2.NumColumns = 2;
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

% chH1 = get(gca,'Children');
% set(gca,'Children',[chH1(end);chH1(1:end-1)]);

% xlim([0.85, iter+1.5]) % dnadsb=0 16unknown
% xlim([0.2, iter+1.5]) % dnadsb=1 16unknown
xlim([11, 100])  %10gene 10unknown
xticks(10:10:100)
%ylim([-404, -394])
% ylim([minY-0.5, maxY+.5]) %dnadsb=0 8unknown
% ylim([minY-1.7, maxY+0.2]) %dnadsb=0 16unknown
% ylim([minY-1, maxY+0.75]) %dnadsb=1 16unknown
% ylim([minY-0.5, maxY+1]) %dnadsb=1 8 unknowns


 
ylim([-108.5, -88]) %without /sqrt(10)  %maxY+0.5]) %10gene 10unknown
%ylim([-104.5,-91])
yticks(-108:2:-86);
box on

figure(2);
minY = min(CEMean);
maxY = max(CEMean);

%u=plot(x,CEMean,'Color', darkblue,'LineWidth',2);
%uistack(a,'top')
% a.Color(4) = 1;
hold on
u = fill(xconf,yconfCE,'blue');
u.FaceColor = [0.8, 0.901, 1];       
u.EdgeColor = [0.8, 0.8, 1];  
u.FaceAlpha = 0.8;
hold on
v=plot(x,CEMean,'Color', darkblue,'LineWidth',2);
% title("dna\_dsb = 0")
xlabel('Number of Likelihood Evaluations')
ylabel('Connectivity Error')
grid on
lgnd2 = legend([v,u],["Proposed Method Mean","95% Confidence Interval"], 'Location', 'northeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

% chH2 = get(gca,'Children');
% set(gca,'Children',[chH2(end);chH2(1:end-1)]);

xlim([0.75, 100])
xticks(0:10:100)
% xlim([0.05, iter+0.75])

% xlim([0.75, iter+1.5])

%ylim([-404, -394])
% ylim([minY-1, maxY+0.5])


ylim([0-2, 16+0.5]) %without /sqrt(10)
%ylim([-1, 13])
yticks(-2 : 17)
box on
