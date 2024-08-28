clear
clc

Lon=-179.75:0.25:180;
Lat=0:0.25:89.75;

data31_window=load('March_window_time.mat');
data3_window=data31_window.March_dat_slope;
data41_window=load('April_windowe_time.mat');
data4_window=data41_window.april_dat_slope;
data51_window=load('May_window_time1.mat');
data5_window=data51_window.May_dat_slope;

AF=load('Africa.mat');
Africa=AF.Africa;
idx=find(Africa>-100);


[M31_P,M32_P]=CompareISF2PeriodPrincton(data3_window);
M31_P(idx)=nan;
M32_P(idx)=nan;
[M41_P,M42_P]=CompareISF2PeriodPrincton(data4_window);
M41_P(idx)=nan;
M42_P(idx)=nan;
[M51_P,M52_P]=CompareISF2PeriodPrincton(data5_window);
M51_P(idx)=nan;
M52_P(idx)=nan;

[fig31]=FigNorthAmericanAndEurasia(Lon,Lat,M31_P);
[fig32]=FigNorthAmericanAndEurasia(Lon,Lat,M32_P);
[fig41]=FigNorthAmericanAndEurasia(Lon,Lat,M41_P);
[fig42]=FigNorthAmericanAndEurasia(Lon,Lat,M42_P);
[fig51]=FigNorthAmericanAndEurasia(Lon,Lat,M51_P);
[fig52]=FigNorthAmericanAndEurasia(Lon,Lat,M52_P);

%%
% A comparison of the average probabilities of each area as ISF region between two time periods in North America and Eurasia.

[NA_mean3,NA_error3]=MeanPriobability(M31_P,M32_P,1);
[Eu_mean3,Eu_error3]=MeanPriobability(M31_P,M32_P,2);

[NA_mean4,NA_error4]=MeanPriobability(M41_P,M42_P,1);
[Eu_mean4,Eu_error4]=MeanPriobability(M41_P,M42_P,2);

[NA_mean5,NA_error5]=MeanPriobability(M51_P,M52_P,1);
[Eu_mean5,Eu_error5]=MeanPriobability(M51_P,M52_P,2);

d1=[NA_mean3(1),NA_mean4(1),NA_mean5(1)];
d2=[NA_mean5(2),NA_mean4(2),NA_mean5(2)];
x1=[0.85 1.85,2.85];
x2=[1.15 2.15,3.15];
error1=[NA_error3(1),NA_error4(1),NA_error5(1)];
error2=[NA_error3(2),NA_error4(2),NA_error5(2)];
figure(1)
bar(x1,d1,0.25)
hold on
errorbar(x1, d1, error1, 'bo','linewidth',2); 
bar(x2,d2,0.25)
errorbar(x2, d2, error2, 'bo','linewidth',2); 
set(gca,'FontName','Arial','FontSize',18,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',3)
set(gca,'xtick',[1 2 3 ]);
set(gca,'xticklabel',{'March ','April ','May'});
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1  ]);
set(gca,'yticklabel',{'0 ','20%','40%','60%','80%','100%'});
ylim([0 1.15])
xlim([0.5 3.5])
title('North America')
set(gca,'Position',[0.1,0.1,0.85,0.5])
ylabel('Average Probability')
ylim([0,1])


d1=[Eu_mean3(1),Eu_mean4(1),Eu_mean5(1)];
d2=[Eu_mean5(2),Eu_mean4(2),Eu_mean5(2)];
x1=[0.85 1.85,2.85];
x2=[1.15 2.15,3.15];
error1=[Eu_error3(1),Eu_error4(1),Eu_error5(1)];
error2=[Eu_error3(2),Eu_error4(2),Eu_error5(2)];
figure(1)
bar(x1,d1,0.25)
hold on
errorbar(x1, d1, error1, 'bo','linewidth',2); % 'b'表示蓝色  
bar(x2,d2,0.25)
errorbar(x2, d2, error2, 'bo','linewidth',2); % 'b'表示蓝色  
set(gca,'FontName','Arial','FontSize',17,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',3)
set(gca,'xtick',[1 2 3 ]);
set(gca,'xticklabel',{'March ','April ','May'});
set(gca,'ytick',[0 0.2 0.4 0.6 0.8 1  ]);
set(gca,'yticklabel',{'0 ','20%','40%','60%','80%','100%'});
ylim([0 1.15])
xlim([0.5 3.5])
title('Eurasia')
set(gca,'Position',[0.1,0.1,0.85,0.45])
ylabel('Average Probability')
ylim([0,1])

%statistical significance test
[h3,p3]=MeanPriobabilityTtest(M31_P,M32_P,1);
[h4,p4]=MeanPriobabilityTtest(M41_P,M42_P,1);
[h5,p5]=MeanPriobabilityTtest(M41_P,M42_P,1);
[h3A,p3A]=MeanPriobabilityTtest(M31_P,M32_P,2);
[h4A,p4A]=MeanPriobabilityTtest(M41_P,M42_P,2);
[h5A,p5A]=MeanPriobabilityTtest(M41_P,M42_P,2);