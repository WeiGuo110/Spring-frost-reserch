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



AF=load('Africa.mat');
Africa=AF.Africa;
pcolor(Africa)
shading flat
idx=find(Africa>-100);


[Per3NA]=PercentCropONSFAmericanAndEurasia(data3_window,1,Land,idx);
[Per3Eu]=PercentCropONSFAmericanAndEurasia(data3_window,2,Land,idx);
[Per4NA]=PercentCropONSFAmericanAndEurasia(data4_window,1,Land,idx);
[Per4Eu]=PercentCropONSFAmericanAndEurasia(data4_window,2,Land,idx);
[Per5NA]=PercentCropONSFAmericanAndEurasia(data5_window,1,Land,idx);
[Per5Eu]=PercentCropONSFAmericanAndEurasia(data5_window,2,Land,idx);


figure(1)
subplot(231)
[datafit1]=LinearEntropyPercent(1:40,Per3NA)
set(gca,'ytick',[0  0.20 0.4 0.6 0.8]);
set(gca,'yticklabel',{'0','20%','40%','60%','80%'})
ylim([-0.1,0.8])
ylabel('Percentage')
title('North America March')

subplot(232)
[datafit1]=LinearEntropyPercent(1:40,Per4NA)
set(gca,'ytick',[0  0.20 0.4 0.6 0.8]);
set(gca,'yticklabel',{'0','20%','40%','60%','80%'})
ylim([-0.1,0.8])
title('North America April')

subplot(233)
[datafit1]=LinearEntropyPercent(1:40,Per5NA)
set(gca,'ytick',[0  0.20 0.4 0.6 0.8]);
set(gca,'yticklabel',{'0','20%','40%','60%','80%'})
ylim([-0.1,0.8])
title('North America May')

subplot(234)
[datafit1]=LinearEntropyPercent(1:40,Per3Eu)
set(gca,'ytick',[0  0.20 0.4 0.6]);
set(gca,'yticklabel',{'0','20%','40%','60%'})
ylim([-0.1,0.6])
xlabel('Year')
ylabel('Percentage')
title('Eurasia March')

subplot(235)
[datafit1]=LinearEntropyPercent(1:40,Per4Eu)
set(gca,'ytick',[0  0.20 0.4 0.6]);
set(gca,'yticklabel',{'0','20%','40%','60%'})
ylim([-0.1,0.6])
xlabel('Year')
title('Eurasia April')

subplot(236)
[datafit1]=LinearEntropyPercent(1:40,Per5Eu)
set(gca,'ytick',[0  0.20 0.4 0.6]);
set(gca,'yticklabel',{'0','20%','40%','60%'})
ylim([-0.1,0.6])
xlabel('Year')
title('Eurasia May')
