
function [datafit]=LinearRegression(x,y)

% x=1948:1982;
% y=March_Number_SF_ISF_31;
datafit=LinearModel.fit(x,y);
parameter=table2array(datafit.Coefficients);
Rsquare=datafit.Rsquared.Ordinary;
k11=parameter(2,1);
p11=parameter(2,4);
sz=25;
scatter(x,y,sz,'filled','MarkerFaceColor','b')
hold on
plot(x,parameter(2,1)*(x)+parameter(1,1),'r','linewidth',3)
box on
set(gca,'FontName','Arial','FontSize',20,'FontWeight','bold','GridAlpha',0.05);
set(gca,'linewidth',3)

end