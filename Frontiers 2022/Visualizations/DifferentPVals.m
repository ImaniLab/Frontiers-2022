black = [0,0,0];
darkblue = [0 0.4470 0.7410];
darkred = [0.6350 0.0780 0.1840];
darkgreen = [0.4660 0.6740 0.1880];
darkyellow = [0.9290 0.6940 0.1250];
darkcyan = [0.3010 0.7450 0.9330];

iter0 = 36;
iter1 = 101;
iter2 = 151;
iter3 = 201;
iter4 = 251;
iter5 = 101;%201;%101;%201;%101;%37;%201;%51; 361

opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];
for i=1:iter5
NormC(i,:) = norm((CTrain(i,:) - opt),1);
end


minError = NormC(1,1);
for i = 2:iter5
    if NormC(i,1)<minError(i-1,1)
        minError(i,1) = NormC(i,1);
    else
        minError(i,1) = minError(i-1,1);
    end    
end

x=1:1:iter5;
y=minError';

%%%
opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];
for i=1:iter5
NormC1(i,:) = norm((CTrain1(i,:) - opt),1);
end


minError1 = NormC1(1,1);
for i = 2:iter5
    if NormC1(i,1)<minError1(i-1,1)
        minError1(i,1) = NormC1(i,1);
    else
        minError1(i,1) = minError1(i-1,1);
    end    
end

x1=1:1:iter5;
y1=minError1';

%%%

opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];
for i=1:iter5
NormC2(i,:) = norm((CTrain2(i,:) - opt),1);
end


minError2 = NormC2(1,1);
for i = 2:iter5
    if NormC2(i,1)<minError2(i-1,1)
        minError2(i,1) = NormC2(i,1);
    else
        minError2(i,1) = minError2(i-1,1);
    end    
end

x2=1:1:iter5;
y2=minError2';
%%%

opt = [1,0,0,0,0,0,0,0,0,0,-1,0,1,0,-1,-1,0,0,0,-1,-1,0,1,0,-1,-1,0,0,0,-1,0,-1,1,0,0,-1,0,0,0,-1,0,-1,1,1,-1,-1,0,0,0,0,0,-1,0,1,0,1,-1,-1,-1,0,0,0,0,0,0,0,0,-1,0,1,0,0,1,0,0,-1,1,0,0,-1,0,0,0,0,0,1,1,-1,1,1,0,0,0,0,0,0,-1,-1,0,0];
for i=1:iter5
NormC3(i,:) = norm((CTrain3(i,:) - opt),1);
end


minError3 = NormC3(1,1);
for i = 2:iter5
    if NormC3(i,1)<minError3(i-1,1)
        minError3(i,1) = NormC3(i,1);
    else
        minError3(i,1) = minError3(i-1,1);
    end    
end

x3=1:1:iter5;
y3=minError3';


figure(1);
plot(x,y,'k','LineWidth',2);
hold on
plot(x1,y1, 'Color',darkblue,'LineStyle',':','LineWidth',2);
hold on
plot(x2,y2, 'Color',darkred,'LineStyle','--','LineWidth',2);
hold on
plot(x3,y3, 'Color',darkgreen,'LineStyle','-.','LineWidth',2);


xlabel('Number of Likelihood Evaluations')
ylabel('Connectivity Error')
grid on
lgnd2 = legend('p = 0.05', 'p = 0.2', 'p = 0.3', 'p = 0.4', 'Location', 'northeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

xlim([0.75, iter5])
ylim([-0.3, 10])
yticks(-1 : 16)
box on