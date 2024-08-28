
clear
clc

%March
%1948-1982
SFk31=load('data_SF_Slope.mat');
SF3_1=SFk31.k31;

%1983-2016
SFk32=load('data_SF_Slope.mat');
SF3_2=SFk32.k32;

%April
%1948-1982
SFk41=load('data_SF_Slope.mat');
SF4_1=SFk41.k41;

%1983-2016
SFk42=load('data_SF_Slope.mat');
SF4_2=SFk42.k42;


%May
%1948-1982
SFk51=load('data_SF_Slope.mat');
SF5_1=SFk51.k51;

%1983-2016
SFk52=load('data_SF_Slope.mat');
SF5_2=SFk52.k52;

%%
%the changes of spring frost number in regions with increased spring frost
%March 1948-1982
[March_Number_SF_ISF_31,R2_31,slope_31,pvale_31]=IncreasedSpringFrost('March_data_SF.mat',1,SF3_1,SF3_2);
%March 1983-2016
[March_Number_SF_ISF_32,R2_32,slope_32,pvale_32]=IncreasedSpringFrost('March_data_SF.mat',2,SF3_1,SF3_2);

%April 1948-1982
[March_Number_SF_ISF_41,R2_41,slope_41,pvale_41]=IncreasedSpringFrost('April_data_SF.mat',1,SF4_1,SF4_2);
%April 1983-2016
[March_Number_SF_ISF_42,R2_42,slope_42,pvale_42]=IncreasedSpringFrost('April_data_SF.mat',2,SF4_1,SF4_2);

%May 1948-1982
[March_Number_SF_ISF_51,R2_51,slope_51,pvale_51]=IncreasedSpringFrost('May_data_SF.mat',1,SF5_1,SF5_2);
%May 1983-2016
[March_Number_SF_ISF_52,R2_52,slope_52,pvale_52]=IncreasedSpringFrost('May_data_SF.mat',2,SF5_1,SF5_2);

figure(1)
subplot(231)
x=1948:1982;
y=March_Number_SF_ISF_31;
[datafit]=LinearRegression(x,y)
ylim([2.3e6, 2.6e6])
xlim([1945,1985])
ylabel('Number of SF')

subplot(232)
x=1948:1982;
y=March_Number_SF_ISF_41;
[datafit]=LinearRegression(x,y)
ylim([1.6e6, 2.1e6])
xlim([1945,1985])

subplot(233)
x=1948:1982;
y=March_Number_SF_ISF_51;
[datafit]=LinearRegression(x,y)
ylim([0.6e6,1e6])
xlim([1945,1985])

subplot(234)
x=1983:2016;
y=March_Number_SF_ISF_32;
[datafit]=LinearRegression(x,y)
ylim([0.4e6,0.7e6])
xlim([1980,2020])
ylabel('Number of SF')
xlabel('Year')

subplot(235)
x=1983:2016;
y=March_Number_SF_ISF_42;
[datafit]=LinearRegression(x,y)
ylim([0.5e6,0.8e6])
xlim([1980,2020])
xlabel('Year')

subplot(236)
x=1983:2016;
y=March_Number_SF_ISF_52;
[datafit]=LinearRegression(x,y)
ylim([0.4e6,0.7e6])
xlim([1980,2020])
xlabel('Year')

%%
%the changes of spring frost number in regions with Decreased spring frost regions
%March 1948-1982
[March_Number_SF_DSF_31]=DecreasedSpringFrost('March_data_SF.mat',1,SF3_1,SF3_2)
%March 1983-2016
[March_Number_SF_DSF_32]=DecreasedSpringFrost('March_data_SF.mat',2,SF3_1,SF3_2);

%April 1948-1982
[March_Number_SF_DSF_41]=DecreasedSpringFrost('April_data_SF.mat',1,SF4_1,SF4_2);
%April 1983-2016
[March_Number_SF_DSF_42]=DecreasedSpringFrost('April_data_SF.mat',2,SF4_1,SF4_2);

%May 1948-1982
[March_Number_SF_DSF_51]=DecreasedSpringFrost('May_data_SF.mat',1,SF5_1,SF5_2);
%May 1983-2016
[March_Number_SF_DSF_52]=DecreasedSpringFrost('May_data_SF.mat',2,SF5_1,SF5_2);

figure(2)
subplot(231)
x=1948:1982;
y=March_Number_SF_DSF_31;
[datafit]=LinearRegression(x,y)
ylim([1e6, 2e6])
xlim([1945,1985])
ylabel('Number of SF')

subplot(232)
x=1948:1982;
y=March_Number_SF_DSF_41;
[datafit]=LinearRegression(x,y)
ylim([1e6, 2e6])
xlim([1945,1985])

subplot(233)
x=1948:1982;
y=March_Number_SF_DSF_51;
[datafit]=LinearRegression(x,y)
ylim([1e6, 2e6])
xlim([1945,1985])

subplot(234)
x=1983:2016;
y=March_Number_SF_DSF_32;
[datafit]=LinearRegression(x,y)
ylim([1e6, 4e6])
xlim([1980,2020])
ylabel('Number of SF')
xlabel('Year')

subplot(235)
x=1983:2016;
y=March_Number_SF_DSF_42;
[datafit]=LinearRegression(x,y)
ylim([1e6, 4e6])
xlim([1980,2020])
xlabel('Year')

subplot(236)
x=1983:2016;
y=March_Number_SF_DSF_52;
[datafit]=LinearRegression(x,y)
ylim([1e6, 4e6])
xlim([1980,2020])
xlabel('Year')

