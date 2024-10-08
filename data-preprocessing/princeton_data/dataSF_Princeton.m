clear;
clc;


%Data download address��https://hydrology.soton.ac.uk/
[FileNames] = GetFileNames(cd,'*.nc');

%%
% March_data_SF
for im=1:size(FileNames,2)
    
    filename=FileNames{im};
    longitude=ncread(filename,'lon');
    latitude=ncread(filename,'lat');
    temperature_daily_min=ncread(filename,'tmin');
    stand_ocean1=load('ocean_mask.mat');
    stand_ocean=stand_ocean1.ac1;
    k=find(isnan(stand_ocean(241:600,:)));
    spring_data=temperature_daily_min(:,:,58:89)-273.15;
    for i=1:1:size(spring_data,3)
        landdata1=spring_data(:,:,i)';
        landdata2=landdata1(241:600,:);
        landdata2(k)=nan; 
        spring_daily_tmin_land(:,:,i)=landdata2;
    end   
    T_LST2=[];
    for i=1:size(spring_daily_tmin_land,1)
        spring_daily_tmin_pixel_11=[];
        T_LST1=[];
        for j=1:size(spring_daily_tmin_land,2)
            temp=spring_daily_tmin_land(i,j,:);
            temp_Vector=(temp(1,:))'; 
            spring_daily_tmin_pixel_11=[ spring_daily_tmin_pixel_11,temp_Vector]; 
            T_LST1=[T_LST1,mean(temp_Vector)];
        end
        spring_daily_tmin_pixel{i,1}={spring_daily_tmin_pixel_11};
        T_LST2=[T_LST2;T_LST1];
    end
    T_LST(:,:,im)=T_LST2;  
    sum_day1=0;
    for id=1:360
        a2=spring_daily_tmin_pixel{id,1}{1,1};
        [m,n]=find(a2<=0);
        sum_day1=sum_day1+length(m);
    end
    sum_day(im)=sum_day1;
    xx=[];
    for i=1:360
        a2=spring_daily_tmin_pixel{i,1}{1,1};
        x=find(a2<0);
        x1=zeros(32,1440);
        x1(x)=1;
        x2=sum(x1);
        xx=[xx;x2];
    end
    xx(k)=nan;

    datasset(:,:,im)=xx;
end
% save('March_data_SF','datasset')


%%
% April_data_SF
for im=1:size(FileNames,2)
    
    filename=FileNames{im};
    longitude=ncread(filename,'lon');
    latitude=ncread(filename,'lat');
    temperature_daily_min=ncread(filename,'tmin');
    stand_ocean1=load('ocean_mask.mat');
    stand_ocean=stand_ocean1.ac1;
    k=find(isnan(stand_ocean(241:600,:)));
    spring_data=temperature_daily_min(:,:,90:121)-273.15;
    for i=1:1:size(spring_data,3)
        landdata1=spring_data(:,:,i)';
        landdata2=landdata1(241:600,:);
        landdata2(k)=nan; 
        spring_daily_tmin_land(:,:,i)=landdata2;
    end   
    T_LST2=[];
    for i=1:size(spring_daily_tmin_land,1)
        spring_daily_tmin_pixel_11=[];
        T_LST1=[];
        for j=1:size(spring_daily_tmin_land,2)
            temp=spring_daily_tmin_land(i,j,:);
            temp_Vector=(temp(1,:))'; 
            spring_daily_tmin_pixel_11=[ spring_daily_tmin_pixel_11,temp_Vector]; 
            T_LST1=[T_LST1,mean(temp_Vector)];
        end
        spring_daily_tmin_pixel{i,1}={spring_daily_tmin_pixel_11};
        T_LST2=[T_LST2;T_LST1];
    end
    T_LST(:,:,im)=T_LST2;  
    sum_day1=0;
    for id=1:360
        a2=spring_daily_tmin_pixel{id,1}{1,1};
        [m,n]=find(a2<=0);
        sum_day1=sum_day1+length(m);
    end
    sum_day(im)=sum_day1;
    xx=[];
    for i=1:360
        a2=spring_daily_tmin_pixel{i,1}{1,1};
        x=find(a2<0);
        x1=zeros(32,1440);
        x1(x)=1;
        x2=sum(x1);
        xx=[xx;x2];
    end
    xx(k)=nan;
    datasset(:,:,im)=xx;
end
% save('April_data_SF','datasset')

%%
% May_data_SF
for im=1:size(FileNames,2)
    filename=FileNames{im};
    longitude=ncread(filename,'lon');
    latitude=ncread(filename,'lat');
    temperature_daily_min=ncread(filename,'tmin');
    stand_ocean1=load('ocean_mask.mat');
    stand_ocean=stand_ocean1.ac1;
    k=find(isnan(stand_ocean(241:600,:)));
    spring_data=temperature_daily_min(:,:,122:153)-273.15;
    for i=1:1:size(spring_data,3)
        landdata1=spring_data(:,:,i)';
        landdata2=landdata1(241:600,:);
        landdata2(k)=nan; 
        spring_daily_tmin_land(:,:,i)=landdata2;
    end   
    T_LST2=[];
    for i=1:size(spring_daily_tmin_land,1)
        spring_daily_tmin_pixel_11=[];
        T_LST1=[];
        for j=1:size(spring_daily_tmin_land,2)
            temp=spring_daily_tmin_land(i,j,:);
            temp_Vector=(temp(1,:))'; 
            spring_daily_tmin_pixel_11=[ spring_daily_tmin_pixel_11,temp_Vector]; 
            T_LST1=[T_LST1,mean(temp_Vector)];
        end
        spring_daily_tmin_pixel{i,1}={spring_daily_tmin_pixel_11};
        T_LST2=[T_LST2;T_LST1];
    end
    T_LST(:,:,im)=T_LST2;  
    sum_day1=0;
    for id=1:360
        a2=spring_daily_tmin_pixel{id,1}{1,1};
        [m,n]=find(a2<=0);
        sum_day1=sum_day1+length(m);
    end
    sum_day(im)=sum_day1;
    xx=[];
    for i=1:360
        a2=spring_daily_tmin_pixel{i,1}{1,1};
        x=find(a2<0);
        x1=zeros(32,1440);
        x1(x)=1;
        x2=sum(x1);
        xx=[xx;x2];
    end
    xx(k)=nan;
    datasset(:,:,im)=xx;
end
% save('May_data_SF','datasset')

%%
%slope
data31=load('March_data_SF.mat');
data3=data31.datasset;

x1=1948:1982;
for i=1:360
    for j=1:1440
        y=squeeze(data3(i,j,1:35));
        datafit=LinearModel.fit(x1,y);
        parameter=table2array(datafit.Coefficients);
        Rsquare=datafit.Rsquared.Ordinary;
        k31(i,j)=parameter(2,1);
        p31(i,j)=parameter(2,4);
    end
end

x1=1983:2016;
for i=1:360
    for j=1:1440
        y=squeeze(data3(i,j,36:end));
        datafit=LinearModel.fit(x1,y);
        parameter=table2array(datafit.Coefficients);
        Rsquare=datafit.Rsquared.Ordinary;
        k32(i,j)=parameter(2,1);
        p32(i,j)=parameter(2,4);
    end
end    
    
data41=load('April_data_SF.mat');
data4=data41.datasset;

x1=1948:1982;
for i=1:360
    for j=1:1440
        y=squeeze(data4(i,j,1:35));
        datafit=LinearModel.fit(x1,y);
        parameter=table2array(datafit.Coefficients);
        Rsquare=datafit.Rsquared.Ordinary;
        k41(i,j)=parameter(2,1);
        p41(i,j)=parameter(2,4);
    end
end

x1=1983:2016;
for i=1:360
    for j=1:1440
        y=squeeze(data4(i,j,36:end));
        datafit=LinearModel.fit(x1,y);
        parameter=table2array(datafit.Coefficients);
        Rsquare=datafit.Rsquared.Ordinary;
        k42(i,j)=parameter(2,1);
        p42(i,j)=parameter(2,4);
    end
end    
    
data51=load('May_data_SF.mat');
data5=data51.datasset;

x1=1948:1982;
for i=1:600
    for j=1:1440
        y=squeeze(data5(i,j,1:35));
        datafit=LinearModel.fit(x1,y);
        parameter=table2array(datafit.Coefficients);
        Rsquare=datafit.Rsquared.Ordinary;
        k51(i,j)=parameter(2,1);
        p51(i,j)=parameter(2,4);
    end
end

x1=1983:2016;
for i=1:360
    for j=1:1440
        y=squeeze(data5(i,j,36:end));
        datafit=LinearModel.fit(x1,y);
        parameter=table2array(datafit.Coefficients);
        Rsquare=datafit.Rsquared.Ordinary;
        k52(i,j)=parameter(2,1);
        p52(i,j)=parameter(2,4);
    end
end    

a1=data3(:,:,1);
idx=find(isnan(a1));
k31(idx)=nan;
k32(idx)=nan;
k41(idx)=nan;
k42(idx)=nan;
k51(idx)=nan;
k52(idx)=nan;
p31(idx)=nan;
p32(idx)=nan;
p41(idx)=nan;
p42(idx)=nan;
p51(idx)=nan;
p52(idx)=nan;
% save('data_SF_Slope','k31','k32','k41','k42','k51','k52','p31','p32','p41','p42','p51','p52');


%%

% A3=load('March_data_SF.mat');
% march=A3.datasset;
% A4=load('April_data_SF.mat');
% april=A4.datasset;
% A5=load('May_data_SF.mat');
% may=A5.datasset;
% save('Data345','march','april','may')

clear
clc

data345=load('Data345.mat');
march=data345.march;

m1=1:1:40;
m2=30:1:69;
for k=1;length(m1)
    data_temp=march(:,:,m1(k):m2(k));
    
    for i=1:size(data_temp,1)
        for j=1:size(data_temp,2)
            data=squeeze(data_temp(i,j,:));
            if length(isnan(data))==length(data)
                slope(i,j)=nan;
                pvalue(i,j)=nan;
                R2(i,j)=nan;
            else
                x=1:length(data);
                datafit=LinearModel.fit(x,data);
                parameter=table2array(datafit.Coefficients);
                k11=parameter(2,1);
                p11=parameter(2,4);
                R2=datafit.Rsquared.Ordinary;
                slope(i,j)=k11;
                pvalue(i,j)=p11;
                R2(i,j)=R2;
            end
        end
    end
    March_dat_slope{i}=slope;
    March_dat_pvalue{i}=pvalue;
    March_dat_R2{i}=pvalue;
end

% save('March_window_time','March_dat_R2','March_dat_pvalue','March_dat_slope');


%%

data345=load('Data345.mat');
april=data345.april;

m1=1:1:40;
m2=30:1:69;
for k=1;length(m1)
    data_temp=april(:,:,m1(k):m2(k));
    
    for i=1:size(data_temp,1)
        for j=1:size(data_temp,2)
            data=squeeze(data_temp(i,j,:));
            if length(isnan(data))==length(data)
                slope(i,j)=nan;
                pvalue(i,j)=nan;
                R2(i,j)=nan;
            else
                x=1:length(data);
                datafit=LinearModel.fit(x,data);
                parameter=table2array(datafit.Coefficients);
                k11=parameter(2,1);
                p11=parameter(2,4);
                R2=datafit.Rsquared.Ordinary;
                slope(i,j)=k11;
                pvalue(i,j)=p11;
                R2(i,j)=R2;
            end
        end
    end
    april_dat_slope{i}=slope;
    april_dat_pvalue{i}=pvalue;
    april_dat_R2{i}=pvalue;
end

% save('April_window_time','april_dat_R2','april_dat_pvalue','april_dat_slope');


%%

data345=load('Data345.mat');
may=data345.may;

m1=1:1:40;
m2=30:1:69;
for k=1;length(m1)
    data_temp=may(:,:,m1(k):m2(k));
    
    for i=1:size(data_temp,1)
        for j=1:size(data_temp,2)
            data=squeeze(data_temp(i,j,:));
            if length(isnan(data))==length(data)
                slope(i,j)=nan;
                pvalue(i,j)=nan;
                R2(i,j)=nan;
            else
                x=1:length(data);
                datafit=LinearModel.fit(x,data);
                parameter=table2array(datafit.Coefficients);
                k11=parameter(2,1);
                p11=parameter(2,4);
                R2=datafit.Rsquared.Ordinary;
                slope(i,j)=k11;
                pvalue(i,j)=p11;
                R2(i,j)=R2;
            end
        end
    end
    May_dat_slope{i}=slope;
    May_dat_pvalue{i}=pvalue;
    May_dat_R2{i}=pvalue;
end

% save('May_window_time1','May_dat_R2','May_dat_pvalue','Mayh_dat_slope');
