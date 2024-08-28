
clear
clc

datalabel=load('Datalabel.mat');
data_label=datalabel.data_label;
longitude=-180:1.875:180-1.875;
latitude=datalabel.latitude;

Lon=longitude;
Lat=latitude(73:end);


dataset=load('HadSlope.mat');
march_slope=dataset.march_slope;
april_slope=dataset.april_slope;
may_slope=dataset.may_slope;

Africa_Had=load('Africa_Had.mat');
AF=Africa_Had.Africa_Had;
idx=find(AF==0);

[M31_P,M32_P]=CompareISF2PeriodPrinctonHad(march_slope,idx);
[M41_P,M42_P]=CompareISF2PeriodPrinctonHad(april_slope,idx);
[M51_P,M52_P]=CompareISF2PeriodPrinctonHad(may_slope,idx);

%%
%The distribution of probability of each area as ISF (increased spring frost) region in North America
[fig31]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M31_P);
[fig32]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M32_P);
[fig41]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M41_P);
[fig42]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M42_P);
[fig51]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M51_P);
[fig52]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M52_P);

%%
% A comparison of the average probabilities of each area as ISF region between two time periods in North America and Eurasia.
[NA_mean3,NA_error3]=MeanPriobabilityHad(M31_P,M32_P,1);
[Eu_mean3,Eu_error3]=MeanPriobabilityHad(M31_P,M32_P,2);

[NA_mean4,NA_error4]=MeanPriobabilityHad(M41_P,M42_P,1);
[Eu_mean4,Eu_error4]=MeanPriobabilityHad(M41_P,M42_P,2);

[NA_mean5,NA_error5]=MeanPriobabilityHad(M51_P,M52_P,1);
[Eu_mean5,Eu_error5]=MeanPriobabilityHad(M51_P,M52_P,2);

d1=[NA_mean3(1),NA_mean4(1),NA_mean5(1)];
d2=[NA_mean5(2),NA_mean4(2),NA_mean5(2)];
x1=[0.85 1.85,2.85];
x2=[1.15 2.15,3.15];
error1=[NA_error3(1),NA_error4(1),NA_error5(1)];
error2=[NA_error3(2),NA_error4(2),NA_error5(2)];

%North America
figure(1)
bar(x1,d1,0.25)
hold on
errorbar(x1, d1, error1, 'bo','linewidth',2); % 'b'表示蓝色  
bar(x2,d2,0.25)
errorbar(x2, d2, error2, 'bo','linewidth',2); % 'b'表示蓝色  
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
%Eurasia
figure(1)
bar(x1,d1,0.25)
hold on
errorbar(x1, d1, error1, 'bo','linewidth',2);  
bar(x2,d2,0.25)
errorbar(x2, d2, error2, 'bo','linewidth',2);  
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
[h31,p31]=MeanPriobabilityTtestHad(M31_P,M32_P,1);
[h32,p32]=MeanPriobabilityTtestHad(M31_P,M32_P,2);
[h41,p41]=MeanPriobabilityTtestHad(M41_P,M42_P,1);
[h42,p42]=MeanPriobabilityTtestHad(M41_P,M42_P,2);
[h51,p51]=MeanPriobabilityTtestHad(M51_P,M52_P,1);
[h52,p52]=MeanPriobabilityTtestHad(M51_P,M52_P,2);


