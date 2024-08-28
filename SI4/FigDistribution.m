function [fig1]=FigDistribution(longitude,latitude,March1_N)

figure(1)
pcolor(longitude,latitude(73:end),March1_N)
shading flat
colorbar;  
colormap('jet');
hold on
ylabel('Latitude(N)','FontWeight','bold','FontName','Arial')
xlabel('Longitude(W)','FontWeight','bold','FontName','Arial')
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150\circW','100\circW','50\circW','0','50\circE','100\circE','150\circE'});
set(gca,'ytick',[20 40 60 80 ]);
set(gca,'yticklabel',{'20\circN','40\circN','60\circN','80\circN'});
set(gca,'FontName','Arial','FontSize',20,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',3)
set(gca,'Position',[0.1,0.1,0.75,0.8])
fig1=1;
end
