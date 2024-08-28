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

%Supplementary information S4
pcolor(Lon,Lat,Land)
shading flat
load coast;
hold on 
plot(long,lat,'k')
plot(long+360,lat,'k')
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150\circW','100\circW','50\circW','0','50\circE','100\circE','150\circE'});
set(gca,'ytick',[20 40 60 80 ]);
set(gca,'yticklabel',{'20\circN','40\circN','60\circN','80\circN'});
set(gca,'FontName','Arial','FontSize',20,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',3)
set(gca,'Position',[0.1,0.1,0.75,0.8])
