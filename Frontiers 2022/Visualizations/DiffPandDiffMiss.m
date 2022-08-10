
%%
black = [0,0,0];
darkblue = [0 0.4470 0.7410];
darkred = [0.6350 0.0780 0.1840];
darkgreen = [0.4660 0.6740 0.1880];
darkyellow = [0.9290 0.6940 0.1250];
darkcyan = [0.3010 0.7450 0.9330];

%p=0.1
% Miss0=0;
% Miss10=0;
% Miss40=0;
% Miss60=0;
% Miss90=2;

%p=0.2
Miss0=0;
Miss10=0;
Miss40=0;
Miss50=2;
Miss60=1;
Miss70=1;
Miss80=2;


X = categorical({'0','10','50','70','90'});
X = reordercats(X,{'0','10','50','70','90'});

x=[0.05,0.1,0.2,0.3,0.4];
y=[0,0,2,1,4.5]; % the last one is actually 2
yerror=[0,0,0,0,4.5];
e = [0,0,0,0,1];

figure();
%bar(x,y,'k','LineWidth',2);
bar(X,y,'FaceColor', darkblue,'LineWidth',2);

hold on
errorbar(X,yerror,e,'rx');
% title("dna\_dsb = 0")
xlabel('Missing Data Percentage')
ylabel('Connectivity Error')
grid on
% lgnd2 = legend('Proposed Method', 'Location', 'northeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

%xlim([-0, 0.45])
ylim([0-0.5, 6])

yticks(-1 : 17)
%xticks(0 :0.05: 0.6)
box on

%%
black = [0,0,0];
darkblue = [0 0.4470 0.7410];
darkred = [0.6350 0.0780 0.1840];
darkgreen = [0.4660 0.6740 0.1880];
darkyellow = [0.9290 0.6940 0.1250];
darkcyan = [0.3010 0.7450 0.9330];

p52=4;
p11=0;
p21=2;
p31=2;
p41=6;

X = categorical({'0.05','0.1','0.2','0.3','0.4'});
X = reordercats(X,{'0.05','0.1','0.2','0.3','0.4'});

x=[0.05,0.1,0.2,0.3,0.4];
y=[4,0,2,2,6];

figure();
%bar(x,y,'k','LineWidth',2);
bar(X,y,'FaceColor', darkblue,'LineWidth',2);
% title("dna\_dsb = 0")
xlabel('Bernoulli Noise')
ylabel('Connectivity Error')
grid on
% lgnd2 = legend('Proposed Method', 'Location', 'northeast');
set(gca,'FontSize',14)
set(gca,'LineWidth',1.2)
set(gca,'fontname', 'Times New Roman')

%xlim([-0, 0.45])
ylim([0-0.5, 6+0.5])

yticks(-1 : 17)
%xticks(0 :0.05: 0.6)
box on
