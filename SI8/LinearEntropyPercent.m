function [datafit1]=LinearEntropyPercent(Per5N,CE5NA)

x=Per5N;
y=CE5NA;
datafit1=LinearModel.fit(x,y)
Rsquare=datafit1.Rsquared.Ordinary;
parameter=table2array(datafit1.Coefficients);
sz=50;
scatter(x,y,sz,'filled','MarkerFaceColor','b')
% plot(x,y,'Color',[0.501960784313725 0.501960784313725 0.501960784313725])

hold on
plot(x,parameter(2,1)*x+parameter(1,1),'r','linewidth',3)
box on
% set(gca,'FontName','Arial','FontSize',16,'FontWeight','bold','GridAlpha',0.05);
% set(gca,'linewidth',3)
set(gca,'xtick',[0:2:40]);
set(gca,'xticklabel',{'1947-1976',' ',' ',' ',' ',' ',' ',' ',' ', ' ', '1968-1997',...
                         ' ',' ',' ',' ',' ',' ',' ',' ', ' ','1987-2016'});
set(gca,'FontName','Arial','FontSize',16,'FontWeight','bold','GridAlpha',0.05);
set(gca,'linewidth',3)

xlim([-5,45])



end



