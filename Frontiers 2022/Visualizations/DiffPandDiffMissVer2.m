
%%
black = [0,0,0];
darkblue = [0 0.4470 0.7410];
lighterblue = [0 0.6470 0.9410];
differentblue = '#80B3FF';
darkred = [0.6350 0.0780 0.1840];
darkgreen = [0.4660 0.6740 0.1880];
darkyellow = [0.9290 0.6940 0.1250];
darkcyan = [0.3010 0.7450 0.9330];
white = [1,1,1];


%p=0.2
Miss0=(0)/10;
Miss20=(1+0+0+0+0+0+0+0+0+0)/10;
Miss50=(1+1+0+0+0+0+0+1+1+0)/10;
Miss70=(2+0+3+0+1+0+0+1+1+0)/10;
Miss90=(2+2+2+3+2+4+4+2+0+2)/10;

Miss0mat=[0,0,0,0,0,0,0,0,0,0];
Miss20mat=[1,0,0,0,0,0,0,0,0,0];
Miss50mat=[1,1,0,0,0,0,0,1,1,0];
Miss70mat=[2,0,3,0,1,0,0,1,1,0];
Miss90mat=[2,2,2,3,2,4,4,2,0,2];

Miss0mean=mean(Miss0mat);
Miss20mean=mean(Miss20mat);
Miss50mean=mean(Miss50mat);
Miss70mean=mean(Miss70mat);
Miss90mean=mean(Miss90mat);

% Miss0std=std(Miss0mat);
% Miss20std=std(Miss20mat);
% Miss50std=std(Miss50mat);
% Miss70std=std(Miss70mat);
% Miss90std=std(Miss90mat);

Miss0std=std(Miss0mat);%/sqrt(10);
Miss20std=std(Miss20mat);%/sqrt(10);
Miss50std=std(Miss50mat);%/sqrt(10);
Miss70std=std(Miss70mat);%/sqrt(10);
Miss90std=std(Miss90mat);%/sqrt(10);

X = categorical({'0','20','50','70','90'});
X = reordercats(X,{'0','20','50','70','90'});

x=[0.05,0.1,0.2,0.3,0.4];
y=[Miss0mean,Miss20mean,Miss50mean,Miss70mean,Miss90mean]; % the last one is actually 2
yerror=[Miss0mean,Miss20mean,Miss50mean,Miss70mean,Miss90mean];
e = [Miss0std,Miss20std,Miss50std,Miss70std,Miss90std];

figure();
%bar(x,y,'k','LineWidth',2);
bar(X,y,'FaceColor', differentblue,'LineWidth',2);

hold on
%errorbar(X,yerror,e,'Marker','x', 'Color', darkred, 'LineWidth', 1.75)
errorbar(X,yerror,e,'x', 'Color', darkred, 'LineWidth', 1.75)
% errorbar(X,yerror,1.96*e,'Marker','x', 'Color', darkred, 'LineWidth', 1.75)
% errorbar(X,yerror,e,'rx');
% title("dna\_dsb = 0")
xlabel('Missing Data Percentage')
ylabel('Connectivity Error')
grid on
% lgnd2 = legend('Proposed Method', 'Location', 'northeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

%xlim([-0, 0.45])
ylim([-0.5, 4])

yticks(-2 : 17)
%xticks(0 :0.05: 0.6)
box on
lgnd1 = legend('Proposed Method Mean','68% Confidence Interval', 'Location', 'northwest');
%%
black = [0,0,0];
darkblue = [0 0.4470 0.7410];
darkred = [0.6350 0.0780 0.1840];
darkgreen = [0.4660 0.6740 0.1880];
darkyellow = [0.9290 0.6940 0.1250];
darkcyan = [0.3010 0.7450 0.9330];

% 50 Missing
p12=(3+0+2+3+4+2+5+4+2+1)/10;
p52=(1+0+0+0+0+0+1+0+0+1)/10;
p11=(0+1+1+0+0+0+0+0+0+0)/10;
p21=(0+0+0+0+0+1+0+2+0+0)/10;
p31=(0+0+2+0+2+0+0+0+3+1)/10;
p41=(3+2+3+1+1+3+1+2+2+2)/10;

p12mat=[3,0,2,3,4,2,5,4,2,1];
p52mat=[1,0,0,0,0,0,1,0,0,1];
p11mat=[0,1,1,0,0,0,0,0,0,0];
p21mat=[0,0,0,0,0,1,0,2,0,0];
p31mat=[0,0,2,0,2,0,0,0,3,1];
p41mat=[3,2,3,1,1,3,1,2,2,2];

p12mean=mean(p12mat);
p52mean=mean(p52mat);
p11mean=mean(p11mat);
p21mean=mean(p21mat);
p31mean=mean(p31mat);
p41mean=mean(p41mat);

% p12std=std(p12mat);
% p52std=std(p52mat);
% p11std=std(p11mat);
% p21std=std(p21mat);
% p31std=std(p31mat);
% p41std=std(p41mat);

p12std=std(p12mat);%/sqrt(10);
p52std=std(p52mat);%/sqrt(10);
p11std=std(p11mat);%/sqrt(10);
p21std=std(p21mat);%/sqrt(10);
p31std=std(p31mat);%/sqrt(10);
p41std=std(p41mat);%/sqrt(10);

% X = categorical({'0.05','0.1','0.2','0.3','0.4'});
% X = reordercats(X,{'0.05','0.1','0.2','0.3','0.4'});
X = categorical({'0.01','0.05','0.1','0.2','0.3','0.4'});
X = reordercats(X,{'0.01','0.05','0.1','0.2','0.3','0.4'});

%x=[0.05,0.1,0.2,0.3,0.4];
x=[0.01,0.05,0.1,0.2,0.3,0.4];
y=[p12mean,p52mean,p11mean,p21mean,p31mean,p41mean]; % the last one is actually 2
yerror=[p12mean,p52mean,p11mean,p21mean,p31mean,p41mean];
e = [p12std,p52std,p11std,p21std,p31std,p41std];

figure();
%bar(x,y,'k','LineWidth',2);
bar(X,y,'FaceColor', differentblue,'LineWidth',2);

hold on
% errorbar(X,yerror,e,'Marker','x', 'Color', black, 'LineWidth', 2);
% errorbar(X,yerror,e,'Marker','x', 'Color', darkred, 'LineWidth', 1.75);
errorbar(X,yerror,e,'x', 'Color', darkred, 'LineWidth', 1.75);
% errorbar(X,yerror,1.96*e,'Marker','x', 'Color', darkred, 'LineWidth', 1.75);
% title("dna\_dsb = 0")
xlabel('Bernoulli Noise')
ylabel('Connectivity Error')
grid on
% lgnd2 = legend('Proposed Method', 'Location', 'northeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

%xlim([-0, 0.45])
ylim([-0.5, 4.5])

yticks(-2 : 17)
%xticks(0 :0.05: 0.6)
box on
lgnd2 = legend('Proposed Method Mean','68% Confidence Interval', 'Location', 'northeast');