clear
clc

data31=load('March_data_SF.mat');
data3=data31.datasset;

data41=load('April_data_SF.mat');
data4=data41.datasset;

data51=load('May_data_SF.mat');
data5=data51.datasset;


for i=1:69
    temp1=data3(:,:,i);
    temp2=temp1(:);
    temp2(find(isnan(temp2)))=[];
    temp3=sum(temp2);
    idx=find(temp1>-1000000);
    N3(i)=temp3/(length(idx)*30);  
end

for i=1:69
    temp1=data4(:,:,i);
    temp2=temp1(:);
    temp2(find(isnan(temp2)))=[];
    temp3=sum(temp2);
    idx=find(temp1>-1000000);
    N4(i)=temp3/(length(idx)*30);  
end

for i=1:69
    temp1=data5(:,:,i);
    temp2=temp1(:);
    temp2(find(isnan(temp2)))=[];
    temp3=sum(temp2);
    idx=find(temp1>-1000000);
    N5(i)=temp3/(length(idx)*30);  
end


figure(1)
x=1948:2016;
y=N3;
datafit=LinearModel.fit(x,y)
parameter=table2array(datafit.Coefficients);
Rsquare=datafit.Rsquared.Ordinary;
k11(i)=parameter(2,1);
p11(i)=parameter(2,4);
sz=25;
scatter(x,y,sz,'filled','MarkerFaceColor','b')
hold on
plot(x,parameter(2,1)*(x)+parameter(1,1),'r','linewidth',3)
box on
set(gca,'FontName','Arial','FontSize',19,'FontWeight','bold','GridAlpha',0.05);
set(gca,'linewidth',3)
ylim([0,1])
set(gca,'ytick',[0.2 0.4 0.6 0.8]);
set(gca,'yticklabel',{'20%','40%','60%','80%'});
ylim([0.19,0.81])

figure(2)
x=1948:2016;
y=N4;
datafit=LinearModel.fit(x,y)
parameter=table2array(datafit.Coefficients);
Rsquare=datafit.Rsquared.Ordinary;
k11(i)=parameter(2,1);
p11(i)=parameter(2,4);
sz=25;
scatter(x,y,sz,'filled','MarkerFaceColor','b')
hold on
plot(x,parameter(2,1)*(x)+parameter(1,1),'r','linewidth',3)
box on
set(gca,'FontName','Arial','FontSize',19,'FontWeight','bold','GridAlpha',0.05);
set(gca,'linewidth',3)
ylim([0,1])
set(gca,'ytick',[0.2 0.4 0.6 0.8]);
set(gca,'yticklabel',{'20%','40%','60%','80%'});
ylim([0.19,0.81])



figure(3)
x=1948:2016;
y=N5;
datafit=LinearModel.fit(x,y)
parameter=table2array(datafit.Coefficients);
Rsquare=datafit.Rsquared.Ordinary;
k11(i)=parameter(2,1);
p11(i)=parameter(2,4);
sz=25;
scatter(x,y,sz,'filled','MarkerFaceColor','b')
hold on
plot(x,parameter(2,1)*(x)+parameter(1,1),'r','linewidth',3)
box on
set(gca,'FontName','Arial','FontSize',19,'FontWeight','bold','GridAlpha',0.05);
set(gca,'linewidth',3)
ylim([0,1])
set(gca,'ytick',[0.2 0.4 0.6 0.8]);
set(gca,'yticklabel',{'20%','40%','60%','80%'});
ylim([0.19,0.81])
