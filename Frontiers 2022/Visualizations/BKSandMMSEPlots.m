t = 1:101;
t = t';


figure(1)
plot(t,NormofError,'b','LineWidth',2);
title("Improvement of BKS Error")
xlabel('Number of Liklihood Function Evaluation')
ylabel('$\frac{1}{\#Data}\sum_{1}^{\#Data}\left\| X_{k}-\hat{X_{k}} \right\|_{1}$','Interpreter','latex') %fix later
grid on
set(gca,'FontSize',12)

figure(2)
plot(t,MSENums,'r','LineWidth',2);
title("Improvement of the MMSE")
xlabel('Number of Liklihood Function Evaluation')
ylabel('MMSE') %fix later
grid on
set(gca,'FontSize',12)

clear all
clc