clear
clc

Lat=(0:0.25:89.75);
Lon=-179.75:0.25:180;

data1=imread('Cropland.tif');
data2=double(data1);
data=data2(1:end-1,1:end-1);
data_land=((fliplr(data'))');
data_land(find(data_land==0))=nan;
data_land(find(data_land>0))=10000;
Land=data_land(361:end,:);

data31_window=load('March_window_time.mat');
data3_window=data31_window.March_dat_slope;
data41_window=load('April_windowe_time.mat');
data4_window=data41_window.april_dat_slope;
data51_window=load('May_window_time1.mat');
data5_window=data51_window.May_dat_slope;

[land_risk31]=RiskSF(data3_window,Land,20);
[land_risk32]=RiskSF(data3_window,Land,40);
[land_risk41]=RiskSF(data4_window,Land,20);
[land_risk42]=RiskSF(data4_window,Land,40);
[land_risk51]=RiskSF(data5_window,Land,20);
[land_risk52]=RiskSF(data5_window,Land,40);

data={land_risk31,land_risk32,land_risk41,land_risk42,land_risk51,land_risk52};

AF=load('Africa.mat');
Africa=AF.Africa;
idx=find(Africa>-100);

%The distribution of probability of cropland located in the ISF (increased spring frost) regions in North America and Eurasia
[fig31]=FigNorthAmericanAndEurasiaCrop(Lon,Lat,land_risk31,Land,idx);
[fig32]=FigNorthAmericanAndEurasiaCrop(Lon,Lat,land_risk32,Land,idx);
[fig41]=FigNorthAmericanAndEurasiaCrop(Lon,Lat,land_risk41,Land,idx);
[fig42]=FigNorthAmericanAndEurasiaCrop(Lon,Lat,land_risk42,Land,idx);
[fig51]=FigNorthAmericanAndEurasiaCrop(Lon,Lat,land_risk51,Land,idx);
[fig52]=FigNorthAmericanAndEurasiaCrop(Lon,Lat,land_risk52,Land,idx);


%% 
% A comparison of the average probability of cropland located in ISF regions between two time periods in North America 

clear
clc

Lat=(0:0.25:89.75);
Lon=-179.75:0.25:180;
data1=imread('Cropland.tif');
data2=double(data1);
data=data2(1:end-1,1:end-1);
data_land=((fliplr(data'))');
data_land(find(data_land==0))=nan;
data_land(find(data_land>0))=10000;
Land=data_land(361:end,:);
data31_window=load('March_window_time.mat');
data3_window=data31_window.March_dat_slope;
data41_window=load('April_windowe_time.mat');
data4_window=data41_window.april_dat_slope;
data51_window=load('May_window_time1.mat');
data5_window=data51_window.May_dat_slope;
[land_risk31]=RiskSF(data3_window,Land,20);
[land_risk32]=RiskSF(data3_window,Land,40);
[land_risk41]=RiskSF(data4_window,Land,20);
[land_risk42]=RiskSF(data4_window,Land,40);
[land_risk51]=RiskSF(data5_window,Land,20);
[land_risk52]=RiskSF(data5_window,Land,40);

AF=load('Africa.mat');
Africa=AF.Africa;
pcolor(Africa)
shading flat
idx=find(Africa>-100);
land_risk31(idx)=nan;
land_risk32(idx)=nan;
land_risk41(idx)=nan;
land_risk42(idx)=nan;
land_risk51(idx)=nan;
land_risk52(idx)=nan;
data1={land_risk31,land_risk32,land_risk41,land_risk42,land_risk51,land_risk52};
data_Pro=zeros(20000,12);
data_Pro_mean=zeros(1,12);
for i=1:6
        dat1=data1{1, i}; 
        A1=dat1(:,1:601);
        A11=A1(:);
        A11(find(isnan(A11)))=[];
        A111=mean(A11)
        data_Pro_mean(2*i-1)= A111;
        data_Pro(1:length(A11),2*i-1)=A11;
        
        
        A1=dat1(:,602:end);
        A22=A1(:);
        A22(find(isnan(A22)))=[];
        A222=mean(A22);
        data_Pro_mean(2*i)= A222;
        data_Pro(1:length(A22),2*i)= A22;
end

%North America
x1=data_Pro(1:5996,1);
x2=data_Pro(1:5996,3);
NA_mean3=[mean(x1),mean(x2)];
error3=[std(x1),std(x2)];
x1=data_Pro(1:6312,5);
x2=data_Pro(1:6312,7);
error4=[std(x1),std(x2)];
NA_mean4=[mean(x1),mean(x2)];
x1=data_Pro(1:5570,9);
x2=data_Pro(1:5570,11);
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
set(gca,'Position',[0.1,0.1,0.85,0.5])
set(gca,'yticklabel',{'0 ','20%','40%','60%','80%','100%'});
ylim([0 1])
xlim([0.5 3.5])
title('North America')
ylabel('Average Probability')

%Eurasia
x1=data_Pro(1:16000,2);
x2=data_Pro(1:16000,4);
Eu_mean3=[mean(x1),mean(x2)];
error3=[std(x1),std(x2)];
x1=data_Pro(1:17806,6);
x2=data_Pro(1:17806,8);
error4=[std(x1),std(x2)];
Eu_mean4=[mean(x1),mean(x2)];
x1=data_Pro(1:15586,10);
x2=data_Pro(1:15586,12);
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
set(gca,'FontName','Arial','FontSize',17,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',3)
set(gca,'xtick',[1 2 3 ]);
set(gca,'xticklabel',{'March ','April ','May'});
set(gca,'Position',[0.1,0.1,0.85,0.5])
set(gca,'yticklabel',{'0 ','20%','40%','60%','80%','100%'});
ylim([0 1.15])
xlim([0.5 3.5])
title('Eurasia')
ylabel('Average Probability')
