clear
clc

%Data download address£ºhttps://www.metoffice.gov.uk/hadobs/hadex3/download_etccdi.html
Data_March=ncread('HadEX3_FD_1901-2018_A.nc','Mar');
Data_April=ncread('HadEX3_FD_1901-2018_A.nc','Apr');
Data_May=ncread('HadEX3_FD_1901-2018_A.nc','May');

for i=1:118
    a1=Data_March(:,:,i);
    a1(find(isnan(a1)))=0;
    a2=Data_April(:,:,i);
    a2(find(isnan(a2)))=0;
    a3=Data_May(:,:,i);
    a3(find(isnan(a3)))=0;
    data1=a1+a2+a3;
    data1(find(data1==0))=nan;
    Data(:,:,i)=data1;
end

datalabel=load('Datalabel.mat');
data_label=datalabel.data_label;
longitude=-180:1.875:180-1.875;
latitude=datalabel.latitude;

%time_window
m1=1:1:89;
m2=30:1:118;
for k=1:length(m1)
    disp(k)
    data2=Data_March(:,:,m1(k):m2(k));
    [Slope_March2,Pavue_March2]=LinearRegression(data2);
    [March2]=transfer(Slope_March2);
    [March2_N]=RestorePixel(data_label,March2);
    march_slope(:,:,k)=March2_N;
end

for k=1:length(m1)
    disp(k)
    data2=Data_April(:,:,m1(k):m2(k));
    [Slope_April2,Pavue_April2]=LinearRegression(data2);
    [April2]=transfer(Slope_April2);
    [April2_N]=RestorePixel(data_label,April2);
    april_slope(:,:,k)=April2_N;
end

for k=1:length(m1)
    disp(k)
    data2=Data_May(:,:,m1(k):m2(k));
    [Slope_May2,Pavue_May2]=LinearRegression(data2);
    [May2]=transfer(Slope_May2);
    [May2_N]=RestorePixel(data_label,May2);
    may_slope(:,:,k)=May2_N;
end

% save('HadSlope','march_slope','april_slope','may_slope');
