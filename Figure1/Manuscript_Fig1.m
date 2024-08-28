clear
clc

%March
%1948-1982
SFk31=load('data_SF_Slope.mat');
SFk3=SFk31.k31;
SF3_1=[SFk3(:,end/2+1:end),SFk3(:,1:end/2)];

%1983-2016
SFk32=load('data_SF_Slope.mat');
SFk33=SFk32.k32;
SF3_2=[SFk33(:,end/2+1:end),SFk33(:,1:end/2)];

%April
%1948-1982
SFk41=load('data_SF_Slope.mat');
SFk4=SFk41.k41;
SF4_1=[SFk4(:,end/2+1:end),SFk4(:,1:end/2)];

%1983-2016
SFk42=load('data_SF_Slope.mat');
SFk43=SFk42.k42;
SF4_2=[SFk43(:,end/2+1:end),SFk43(:,1:end/2)];


%May
%1948-1982
SFk51=load('data_SF_Slope.mat');
SFk5=SFk51.k51;
SF5_1=[SFk5(:,end/2+1:end),SFk5(:,1:end/2)];

%1983-2016
SFk52=load('data_SF_Slope.mat');
SFk53=SFk52.k52;
SF5_2=[SFk53(:,end/2+1:end),SFk53(:,1:end/2)];

Lon=-179.75:0.25:180;
Lat=0:0.25:89.75;

data={SF3_1,SF3_2,SF4_1,SF4_2,SF5_1,SF5_2};


%%
%March 1948-1982
figure(1)
pcolor(Lon,Lat,data{1,1})
shading flat
hold on
colormap('jet')
caxis([-0.75,0.48])
colorbar('northoutside','position',[0.1 0.91 0.65 0.03]);
set(gca,'FontName','Arial','FontSize',25,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',2)
set(gca,'Position',[0.1,0.1,0.75,0.8])
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150��W','100��W ', '50��W ','0', '50��E','100��E','150��E'})
set(gca,'ytick',[0 20 40 60 80]);
set(gca,'yticklabel',{'0\circN','20\circN','40\circN','60\circN','80\circN'},...
    'YTickLabelRotation',90)
set(gca,'CLim',[-0.447899159663877 0.27675],'Colormap',...
    [0 1 1;0 0.973684191703796 1;0 0.947368443012238 1;0 0.921052634716034 1;0 0.89473682641983 1;0 0.868421077728271 1;0 0.842105269432068 1;0 0.815789461135864 1;0 0.789473712444305 1;0 0.763157904148102 1;0 0.736842095851898 1;0 0.710526287555695 1;0 0.684210538864136 1;0 0.657894730567932 1;0 0.631578922271729 1;0 0.60526317358017 1;0 0.578947365283966 1;0 0.552631556987762 1;0 0.526315808296204 1;0 0.5 1;0 0.473684221506119 1;0 0.447368413209915 1;0 0.421052634716034 1;0 0.394736856222153 1;0 0.368421047925949 1;0 0.342105269432068 1;0 0.315789461135864 1;0 0.289473682641983 1;0 0.263157904148102 1;0 0.236842110753059 1;0 0.210526317358017 1;0 0.184210523962975 1;0 0.157894730567932 1;0 0.131578952074051 1;0 0.105263158679008 1;0 0.0789473652839661 1;0 0.0526315793395042 1;0 0.0263157896697521 1;0 0 1;0 1 0;1 0 1;1 0 0.95652174949646;1 0 0.91304349899292;1 0 0.869565188884735;1 0 0.826086938381195;1 0 0.782608687877655;1 0 0.739130437374115;1 0 0.695652186870575;1 0 0.652173936367035;1 0 0.60869562625885;1 0 0.56521737575531;1 0 0.52173912525177;1 0 0.47826087474823;1 0 0.434782594442368;1 0 0.391304343938828;1 0 0.347826093435287;1 0 0.304347813129425;1 0 0.260869562625885;1 0 0.217391297221184;1 0 0.173913046717644;1 0 0.130434781312943;1 0 0.0869565233588219;1 0 0.0434782616794109;1 0 0]);

%March 1983-2016
figure(2)
pcolor(Lon,Lat,data{1,2})
shading flat
hold on
colormap('jet')
caxis([-0.75,0.48])
colorbar('northoutside','position',[0.1 0.91 0.65 0.03]);
set(gca,'FontName','Arial','FontSize',25,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',2)
set(gca,'Position',[0.1,0.1,0.75,0.8])
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150��W','100��W ', '50��W ','0', '50��E','100��E','150��E'})
set(gca,'ytick',[0 20 40 60 80]);
set(gca,'yticklabel',{'0\circN','20\circN','40\circN','60\circN','80\circN'},...
    'YTickLabelRotation',90)
set(gca,'CLim',[-0.74 0.48],'Colormap',...
    [0 1 1;0 0.972972989082336 1;0 0.945945918560028 1;0 0.918918907642365 1;0 0.891891896724701 1;0 0.864864885807037 1;0 0.837837815284729 1;0 0.810810804367065 1;0 0.783783793449402 1;0 0.756756782531738 1;0 0.72972971200943 1;0 0.702702701091766 1;0 0.675675690174103 1;0 0.648648619651794 1;0 0.621621608734131 1;0 0.594594597816467 1;0 0.567567586898804 1;0 0.540540516376495 1;0 0.513513505458832 1;0 0.486486494541168 1;0 0.459459453821182 1;0 0.432432442903519 1;0 0.405405402183533 1;0 0.378378391265869 1;0 0.351351350545883 1;0 0.324324309825897 1;0 0.297297298908234 1;0 0.270270258188248 1;0 0.243243247270584 1;0 0.216216221451759 1;0 0.189189195632935 1;0 0.162162154912949 1;0 0.135135129094124 1;0 0.10810811072588 1;0 0.0810810774564743 1;0 0.0540540553629398 1;0 0.0270270276814699 1;0 0 1;0 1 0;1 0 1;1 0 0.958333313465118;1 0 0.916666686534882;1 0 0.875;1 0 0.833333313465118;1 0 0.791666686534882;1 0 0.75;1 0 0.708333313465118;1 0 0.666666686534882;1 0 0.625;1 0 0.583333313465118;1 0 0.541666686534882;1 0 0.5;1 0 0.458333343267441;1 0 0.416666656732559;1 0 0.375;1 0 0.333333343267441;1 0 0.291666656732559;1 0 0.25;1 0 0.20833332836628;1 0 0.16666667163372;1 0 0.125;1 0 0.0833333358168602;1 0 0.0416666679084301;1 0 0]);


%%
%April 1948-1982
figure(3)
pcolor(Lon,Lat,data{1,3})
shading flat
hold on
colormap('jet')
caxis([-0.75,0.48])
colorbar('northoutside','position',[0.1 0.91 0.65 0.03]);
set(gca,'FontName','Arial','FontSize',25,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',2)
set(gca,'Position',[0.1,0.1,0.75,0.8])
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150��W','100��W ', '50��W ','0', '50��E','100��E','150��E'})
set(gca,'ytick',[0 20 40 60 80]);
set(gca,'yticklabel',{'0\circN','20\circN','40\circN','60\circN','80\circN'},...
    'YTickLabelRotation',90)
set(gca,'CLim',[-0.72 0.48],'Colormap',...
    [0 1 1;0 0.972972989082336 1;0 0.945945918560028 1;0 0.918918907642365 1;0 0.891891896724701 1;0 0.864864885807037 1;0 0.837837815284729 1;0 0.810810804367065 1;0 0.783783793449402 1;0 0.756756782531738 1;0 0.72972971200943 1;0 0.702702701091766 1;0 0.675675690174103 1;0 0.648648619651794 1;0 0.621621608734131 1;0 0.594594597816467 1;0 0.567567586898804 1;0 0.540540516376495 1;0 0.513513505458832 1;0 0.486486494541168 1;0 0.459459453821182 1;0 0.432432442903519 1;0 0.405405402183533 1;0 0.378378391265869 1;0 0.351351350545883 1;0 0.324324309825897 1;0 0.297297298908234 1;0 0.270270258188248 1;0 0.243243247270584 1;0 0.216216221451759 1;0 0.189189195632935 1;0 0.162162154912949 1;0 0.135135129094124 1;0 0.10810811072588 1;0 0.0810810774564743 1;0 0.0540540553629398 1;0 0.0270270276814699 1;0 0 1;0 1 0;1 0 1;1 0 0.958333313465118;1 0 0.916666686534882;1 0 0.875;1 0 0.833333313465118;1 0 0.791666686534882;1 0 0.75;1 0 0.708333313465118;1 0 0.666666686534882;1 0 0.625;1 0 0.583333313465118;1 0 0.541666686534882;1 0 0.5;1 0 0.458333343267441;1 0 0.416666656732559;1 0 0.375;1 0 0.333333343267441;1 0 0.291666656732559;1 0 0.25;1 0 0.20833332836628;1 0 0.16666667163372;1 0 0.125;1 0 0.0833333358168602;1 0 0.0416666679084301;1 0 0]);

%April 1983-2016

figure(4)
pcolor(Lon,Lat,data{1,4})
shading flat
hold on
colormap('jet')
caxis([-0.75,0.48])
colorbar('northoutside','position',[0.1 0.91 0.65 0.03]);
set(gca,'FontName','Arial','FontSize',25,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',2)
set(gca,'Position',[0.1,0.1,0.75,0.8])
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150��W','100��W ', '50��W ','0', '50��E','100��E','150��E'})
set(gca,'ytick',[0 20 40 60 80]);
set(gca,'yticklabel',{'0\circN','20\circN','40\circN','60\circN','80\circN'},...
    'YTickLabelRotation',90)
set(gca,'CLim',[-0.75 0.46],'Colormap',...
    [0 1 1;0 0.973684191703796 1;0 0.947368443012238 1;0 0.921052634716034 1;0 0.89473682641983 1;0 0.868421077728271 1;0 0.842105269432068 1;0 0.815789461135864 1;0 0.789473712444305 1;0 0.763157904148102 1;0 0.736842095851898 1;0 0.710526287555695 1;0 0.684210538864136 1;0 0.657894730567932 1;0 0.631578922271729 1;0 0.60526317358017 1;0 0.578947365283966 1;0 0.552631556987762 1;0 0.526315808296204 1;0 0.5 1;0 0.473684221506119 1;0 0.447368413209915 1;0 0.421052634716034 1;0 0.394736856222153 1;0 0.368421047925949 1;0 0.342105269432068 1;0 0.315789461135864 1;0 0.289473682641983 1;0 0.263157904148102 1;0 0.236842110753059 1;0 0.210526317358017 1;0 0.184210523962975 1;0 0.157894730567932 1;0 0.131578952074051 1;0 0.105263158679008 1;0 0.0789473652839661 1;0 0.0526315793395042 1;0 0.0263157896697521 1;0 0 1;0 1 0;1 0 1;1 0 0.95652174949646;1 0 0.91304349899292;1 0 0.869565188884735;1 0 0.826086938381195;1 0 0.782608687877655;1 0 0.739130437374115;1 0 0.695652186870575;1 0 0.652173936367035;1 0 0.60869562625885;1 0 0.56521737575531;1 0 0.52173912525177;1 0 0.47826087474823;1 0 0.434782594442368;1 0 0.391304343938828;1 0 0.347826093435287;1 0 0.304347813129425;1 0 0.260869562625885;1 0 0.217391297221184;1 0 0.173913046717644;1 0 0.130434781312943;1 0 0.0869565233588219;1 0 0.0434782616794109;1 0 0]);


%%
%May 1948-1982
figure(5)
pcolor(Lon,Lat,data{1,5})
shading flat
hold on
colormap('jet')
caxis([-0.75,0.48])
colorbar('northoutside','position',[0.1 0.91 0.65 0.03]);
set(gca,'FontName','Arial','FontSize',25,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',2)
set(gca,'Position',[0.1,0.1,0.75,0.8])
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150��W','100��W ', '50��W ','0', '50��E','100��E','150��E'})
set(gca,'ytick',[0 20 40 60 80]);
set(gca,'yticklabel',{'0\circN','20\circN','40\circN','60\circN','80\circN'},...
    'YTickLabelRotation',90)
set(gca,'CLim',[-0.75 0.49],'Colormap',...
    [0 1 1;0 0.972972989082336 1;0 0.945945918560028 1;0 0.918918907642365 1;0 0.891891896724701 1;0 0.864864885807037 1;0 0.837837815284729 1;0 0.810810804367065 1;0 0.783783793449402 1;0 0.756756782531738 1;0 0.72972971200943 1;0 0.702702701091766 1;0 0.675675690174103 1;0 0.648648619651794 1;0 0.621621608734131 1;0 0.594594597816467 1;0 0.567567586898804 1;0 0.540540516376495 1;0 0.513513505458832 1;0 0.486486494541168 1;0 0.459459453821182 1;0 0.432432442903519 1;0 0.405405402183533 1;0 0.378378391265869 1;0 0.351351350545883 1;0 0.324324309825897 1;0 0.297297298908234 1;0 0.270270258188248 1;0 0.243243247270584 1;0 0.216216221451759 1;0 0.189189195632935 1;0 0.162162154912949 1;0 0.135135129094124 1;0 0.10810811072588 1;0 0.0810810774564743 1;0 0.0540540553629398 1;0 0.0270270276814699 1;0 0 1;0 1 0;1 0 1;1 0 0.958333313465118;1 0 0.916666686534882;1 0 0.875;1 0 0.833333313465118;1 0 0.791666686534882;1 0 0.75;1 0 0.708333313465118;1 0 0.666666686534882;1 0 0.625;1 0 0.583333313465118;1 0 0.541666686534882;1 0 0.5;1 0 0.458333343267441;1 0 0.416666656732559;1 0 0.375;1 0 0.333333343267441;1 0 0.291666656732559;1 0 0.25;1 0 0.20833332836628;1 0 0.16666667163372;1 0 0.125;1 0 0.0833333358168602;1 0 0.0416666679084301;1 0 0]);

%May 1983-2016
figure(6)
pcolor(Lon,Lat,data{1,6})
shading flat
hold on
colormap('jet')
caxis([-0.75,0.48])
colorbar('northoutside','position',[0.1 0.91 0.65 0.03]);
set(gca,'FontName','Arial','FontSize',25,'FontWeight','bold','FontName','Arial');
set(gca,'linewidth',2)
set(gca,'Position',[0.1,0.1,0.75,0.8])
set(gca,'xtick',[-150 -100 -50 0 50 100 150 ]);
set(gca,'xticklabel',{'150��W','100��W ', '50��W ','0', '50��E','100��E','150��E'})
set(gca,'ytick',[0 20 40 60 80]);
set(gca,'yticklabel',{'0\circN','20\circN','40\circN','60\circN','80\circN'},...
    'YTickLabelRotation',90)
set(gca,'CLim',[-0.75 0.49],'Colormap',...
    [0 1 1;0 0.972972989082336 1;0 0.945945918560028 1;0 0.918918907642365 1;0 0.891891896724701 1;0 0.864864885807037 1;0 0.837837815284729 1;0 0.810810804367065 1;0 0.783783793449402 1;0 0.756756782531738 1;0 0.72972971200943 1;0 0.702702701091766 1;0 0.675675690174103 1;0 0.648648619651794 1;0 0.621621608734131 1;0 0.594594597816467 1;0 0.567567586898804 1;0 0.540540516376495 1;0 0.513513505458832 1;0 0.486486494541168 1;0 0.459459453821182 1;0 0.432432442903519 1;0 0.405405402183533 1;0 0.378378391265869 1;0 0.351351350545883 1;0 0.324324309825897 1;0 0.297297298908234 1;0 0.270270258188248 1;0 0.243243247270584 1;0 0.216216221451759 1;0 0.189189195632935 1;0 0.162162154912949 1;0 0.135135129094124 1;0 0.10810811072588 1;0 0.0810810774564743 1;0 0.0540540553629398 1;0 0.0270270276814699 1;0 0 1;0 1 0;1 0 1;1 0 0.958333313465118;1 0 0.916666686534882;1 0 0.875;1 0 0.833333313465118;1 0 0.791666686534882;1 0 0.75;1 0 0.708333313465118;1 0 0.666666686534882;1 0 0.625;1 0 0.583333313465118;1 0 0.541666686534882;1 0 0.5;1 0 0.458333343267441;1 0 0.416666656732559;1 0 0.375;1 0 0.333333343267441;1 0 0.291666656732559;1 0 0.25;1 0 0.20833332836628;1 0 0.16666667163372;1 0 0.125;1 0 0.0833333358168602;1 0 0.0416666679084301;1 0 0]);









