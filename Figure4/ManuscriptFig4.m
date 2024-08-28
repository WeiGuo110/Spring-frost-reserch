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

% Hadex dataset
dataset=load('HadSlope.mat');
march_slope=dataset.march_slope;
april_slope=dataset.april_slope;
may_slope=dataset.may_slope;

Africa_Had=load('Africa_Had.mat');
AF=Africa_Had.Africa_Had;
idx=find(AF==0);
[PerNA3]=CropPercentageHadexNoAfrica(march_slope,1,T2,idx);
[PerEu3]=CropPercentageHadexNoAfrica(march_slope,2,T2,idx);
[PerNA4]=CropPercentageHadexNoAfrica(april_slope,1,T2,idx);
[PerEu4]=CropPercentageHadexNoAfrica(april_slope,2,T2,idx);
[PerNA5]=CropPercentageHadexNoAfrica(may_slope,1,T2,idx);
[PerEu5]=CropPercentageHadexNoAfrica(may_slope,2,T2,idx);

figure(1)
subplot(231)
[datafit1]=LinearEntropyPercent(1:40,PerNA3)
set(gca,'ytick',[0  0.20 0.4 0.6 0.8]);
set(gca,'yticklabel',{'0','20%','40%','60%','80%'})
ylim([-0.18,0.8])
ylabel('Percentage')
title('North America March')
ylim([-0.18,1])

subplot(232)
[datafit1]=LinearEntropyPercent(1:40,PerNA4)
set(gca,'ytick',[0  0.20 0.4 0.6 0.8]);
set(gca,'yticklabel',{'0','20%','40%','60%','80%'})
ylim([-0.18,0.8])

title('North America April')

subplot(233)
[datafit1]=LinearEntropyPercent(1:40,PerNA5)
set(gca,'ytick',[0  0.20 0.4 0.6 0.8]);
set(gca,'yticklabel',{'0','20%','40%','60%','80%'})
ylim([-0.18,0.8])
title('North America May')


subplot(234)
[datafit1]=LinearEntropyPercent(1:40,PerEu3)
set(gca,'ytick',[0  0.20 0.4 0.6]);
set(gca,'yticklabel',{'0','20%','40%','60%'})
ylim([-0.15,0.6])
xlabel('Year')
ylabel('Percentage')
title('Eurasia March')

subplot(235)
[datafit1]=LinearEntropyPercent(1:40,PerEu4)
set(gca,'ytick',[0  0.20 0.4 0.6]);
set(gca,'yticklabel',{'0','20%','40%','60%'})
ylim([-0.15,0.6])
xlabel('Year')
title('Eurasia April')

subplot(236)
[datafit1]=LinearEntropyPercent(1:40,PerEu5)
set(gca,'ytick',[0  0.20 0.4 0.6]);
set(gca,'yticklabel',{'0','20%','40%','60%'})
ylim([-0.15,0.6])
xlabel('Year')
title('Eurasia May')
