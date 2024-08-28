function [idx3,land_risk3]=RiskFig(Lon,Lat,land_risk3,Land)

idx3=find(land_risk3>0);
land3=Land;
land3(idx3)=nan;
idx31=find(land3>-100000);
land_risk3(idx31)=0;

pcolor(Lon,Lat,land_risk3)
shading flat
load coast;
hold on 
plot(long,lat,'k')
plot(long+360,lat,'k')
end

