
function [fig]=FigNorthAmericanAndEurasiaHad(Lon,Lat,M31_P)


figure(1)
subplot(121)
pcolor(Lon(1:end/2-7),Lat,M31_P(:,1:end/2-7))
shading flat
title('North America')
set(gca,'Position',[0.1,0.1,0.75*(650/1440),0.8])
colorbar;  
colormap('jet');
set(gca,'FontName','Arial','FontSize',20,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',3)
set(gca,'xtick',[-150 -100 -50 ]);
set(gca,'xticklabel',{'150\circW','100\circW','50\circW'});
set(gca,'ytick',[0,20 40 60 80 ]);
set(gca,'yticklabel',{'0','20\circN','40\circN','60\circN','80\circN'});
colorbar(gca,'Ticks',[0 0.2 0.4 0.6 0.8 1],...
        'TickLabels',{' ',' ',' ',' ',' ',' '});
load coast;
hold on 
plot(long,lat,'k')
plot(long+360,lat,'k')



subplot(122)
pcolor(Lon(end/2-7+1:end),Lat,M31_P(:,end/2-7+1:end))
shading flat
title('Eurasia')
set(gca,'Position',[0.1+0.75*(650/1440)+0.05,0.1,0.75*((1440-650)/1440),0.8])
colorbar;  
colormap('jet');
set(gca,'FontName','Arial','FontSize',20,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',3)
set(gca,'xtick',[0 50 100 150 ]);
set(gca,'xticklabel',{'0','50\circE','100\circE','150\circE'});
set(gca,'ytick',[0,20 40 60 80 ]);
set(gca,'yticklabel',{'0','20\circN','40\circN','60\circN','80\circN'});
colorbar(gca,'Ticks',[0 0.2 0.4 0.6 0.8 1],...
        'TickLabels',{'0','20%','40%','60%','80%','100%'});
load coast;
hold on 
plot(long,lat,'k')
plot(long+360,lat,'k')


fig=3;
end

