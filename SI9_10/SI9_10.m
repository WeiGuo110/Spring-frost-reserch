clear
clc


data1=imread('Cropland0125.tif');
data2=double(data1);
data=data2(1:end-1,1:end-1);
data_land=((fliplr(data'))');
data_land(find(data_land>0))=10000;
Land=data_land(721:end,:);

data1_partiti=mat2cell(Land,10*ones(1,72),15*ones(1,192));
T2=cellfun(@mean,cellfun(@mean,data1_partiti,'UniformOutput', false));
HDW_uniform=T2;
T2(find(T2>0))=100000;
T2(find(T2==0))=nan;
Land=T2;

% Hadex dataset
dataset=load('HadSlope.mat');
march_slope=dataset.march_slope;
april_slope=dataset.april_slope;
may_slope=dataset.may_slope;

data_window3=march_slope(:,:,48:87);
data_window4=april_slope(:,:,48:87);
data_window5=may_slope(:,:,48:87);

[land_risk31]=RiskSFHad(data_window3,Land,20);
[land_risk32]=RiskSFHad(data_window3,Land,40);
[land_risk41]=RiskSFHad(data_window4,Land,20);
[land_risk42]=RiskSFHad(data_window4,Land,40);
[land_risk51]=RiskSFHad(data_window5,Land,20);
[land_risk52]=RiskSFHad(data_window5,Land,40);

data1={land_risk31,land_risk32,land_risk41,land_risk42,land_risk51,land_risk52};


datalabel=load('Datalabel.mat');
data_label=datalabel.data_label;
longitude=-180:1.875:180-1.875;
latitude=datalabel.latitude;

Lon=longitude;
Lat=latitude(73:end);

[idx31,M31_P]=RiskFig(Lon,Lat,land_risk31,Land);
[idx32,M32_P]=RiskFig(Lon,Lat,land_risk32,Land);
[idx41,M41_P]=RiskFig(Lon,Lat,land_risk41,Land);
[idx42,M42_P]=RiskFig(Lon,Lat,land_risk42,Land);
[idx51,M51_P]=RiskFig(Lon,Lat,land_risk51,Land);
[idx52,M52_P]=RiskFig(Lon,Lat,land_risk52,Land);


Africa_Had=load('Africa_Had.mat');
AF=Africa_Had.Africa_Had;
idx44=find(AF==0);

M31_P(idx44)=nan;
M31_P(1:18,80:130)=nan;
M32_P(idx44)=nan;
M32_P(1:18,80:130)=nan;
M41_P(idx44)=nan;
M41_P(1:18,80:130)=nan;
M42_P(idx44)=nan;
M42_P(1:18,80:130)=nan;
M51_P(idx44)=nan;
M51_P(1:18,80:130)=nan;
M52_P(idx44)=nan;
M52_P(1:18,80:130)=nan;

%The distribution of probability of cropland located in the ISF (increased spring frost) regions in North America and Eurasia
[fig31]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M31_P);
[fig32]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M32_P);
[fig41]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M41_P);
[fig42]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M42_P);
[fig51]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M51_P);
[fig52]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M52_P);

%% 
% A comparison of the average probability of cropland located in ISF regions between two time periods in North America 
data_Pro=zeros(2000,12);
data_Pro_mean=zeros(1,12);
for i=1:6
        dat1=data1{1, i}; 
        A1=dat1(:,1:75);
        A11=A1(:);
        A11(find(isnan(A11)))=[];
        A111=mean(A11)
        data_Pro_mean(2*i-1)= A111;
        data_Pro(1:length(A11),2*i-1)=A11;
        
        
        A1=dat1(:,76:end);
        A22=A1(:);
        A22(find(isnan(A22)))=[];
        A222=mean(A22);
        data_Pro_mean(2*i)= A222;
        data_Pro(1:length(A22),2*i)= A22;
end

%North America
x1=data_Pro(1:670,1);
x2=data_Pro(1:670,3);
NA_mean3=[mean(x1),mean(x2)];
error3=[std(x1),std(x2)];
x1=data_Pro(1:664,5);
x2=data_Pro(1:664,7);
error4=[std(x1),std(x2)];
NA_mean4=[mean(x1),mean(x2)];
x1=data_Pro(1:580,9);
x2=data_Pro(1:580,11);
error5=[std(x1),std(x2)];
NA_mean5=[mean(x1),mean(x2)];
d1=[NA_mean3(1),NA_mean4(1),NA_mean5(1)];
d2=[NA_mean5(2),NA_mean4(2),NA_mean5(2)];
x1=[0.85 1.85,2.85];
x2=[1.15 2.15,3.15];
error1=[error3(1),error4(1),error5(1)];
error2=[error3(2),error4(2),error5(2)];
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


%Eurasia
x1=data_Pro(1:1346,2);
x2=data_Pro(1:1346,4);
Eu_mean3=[mean(x1),mean(x2)];
error3=[std(x1),std(x2)];
x1=data_Pro(1:1274,6);
x2=data_Pro(1:1274,8);
error4=[std(x1),std(x2)];
Eu_mean4=[mean(x1),mean(x2)];
x1=data_Pro(1:1243,10);
x2=data_Pro(1:1243,12);
error5=[std(x1),std(x2)];
Eu_mean5=[mean(x1),mean(x2)];
d1=[Eu_mean3(1),Eu_mean4(1),Eu_mean5(1)];
d2=[Eu_mean3(2),Eu_mean4(2),Eu_mean5(2)];
x1=[0.85 1.85,2.85];
x2=[1.15 2.15,3.15];
error1=[error3(1),error4(1),error5(1)];
error2=[error3(2),error4(2),error5(2)];
figure(2)
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
title('Eurasia')
set(gca,'Position',[0.1,0.1,0.85,0.5])
ylabel('Average Probability')
ylim([0,1])

