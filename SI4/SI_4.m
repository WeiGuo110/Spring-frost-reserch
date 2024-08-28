clear
clc

datalabel=load('Datalabel.mat');
data_label=datalabel.data_label;
longitude=-180:1.875:180-1.875;
latitude=datalabel.latitude;

Data_March=ncread('HadEX3_FD_1901-2018_A.nc','Mar');
Data_April=ncread('HadEX3_FD_1901-2018_A.nc','Apr');
Data_May=ncread('HadEX3_FD_1901-2018_A.nc','May');

%1948-1982
data1=Data_May(:,:,48:81);
%1983-2016
data2=Data_May(:,:,82:116);
[Slope_May1,Pavue_May1]=LinearRegression(data1);
[Slope_May2,Pavue_May2]=LinearRegression(data2);

[Slope_March1,Pavue_March1]=LinearRegression(Data_March(:,:,48:81));
[Slope_March2,Pavue_March2]=LinearRegression(Data_March(:,:,82:116));

[Slope_April1,Pavue_April1]=LinearRegression(Data_April(:,:,48:81));
[Slope_April2,Pavue_April2]=LinearRegression(Data_April(:,:,82:116));

[March1]=transfer(Slope_March1);
[March2]=transfer(Slope_March2);
[April1]=transfer(Slope_April1);
[April2]=transfer(Slope_April2);
[May1]=transfer(Slope_May1);
[May2]=transfer(Slope_May2);

[March1_N]=RestorePixel(data_label,March1);
[March2_N]=RestorePixel(data_label,March2);
[April1_N]=RestorePixel(data_label,April1);
[April2_N]=RestorePixel(data_label,April2);
[May1_N]=RestorePixel(data_label,May1);
[May2_N]=RestorePixel(data_label,May2);


%The distribution of risk in spring frost
%1948-1982,March
[fig1]=FigDistribution(longitude,latitude,March1_N);
set(gca,'CLim',[-0.243276417574143 0.60784],'Colormap',...
    [0 1 1;0 0.941176474094391 1;0 0.882352948188782 1;0 0.823529422283173 1;0 0.764705896377563 1;0 0.705882370471954 1;0 0.647058844566345 1;0 0.588235318660736 1;0 0.529411792755127 1;0 0.470588237047195 1;0 0.411764711141586 1;0 0.352941185235977 1;0 0.294117659330368 1;0 0.235294118523598 1;0 0.176470592617989 1;0 0.117647059261799 1;0 0.0588235296308994 1;0 0 1;0 1 0;1 0 1;1 0 0.977272748947144;1 0 0.954545438289642;1 0 0.931818187236786;1 0 0.909090936183929;1 0 0.886363625526428;1 0 0.863636374473572;1 0 0.840909063816071;1 0 0.818181812763214;1 0 0.795454561710358;1 0 0.772727251052856;1 0 0.75;1 0 0.727272748947144;1 0 0.704545438289642;1 0 0.681818187236786;1 0 0.659090936183929;1 0 0.636363625526428;1 0 0.613636374473572;1 0 0.590909063816071;1 0 0.568181812763214;1 0 0.545454561710358;1 0 0.522727251052856;1 0 0.5;1 0 0.477272719144821;1 0 0.454545468091965;1 0 0.431818187236786;1 0 0.409090906381607;1 0 0.386363625526428;1 0 0.363636374473572;1 0 0.340909093618393;1 0 0.318181812763214;1 0 0.295454531908035;1 0 0.272727280855179;1 0 0.25;1 0 0.227272734045982;1 0 0.204545453190804;1 0 0.181818187236786;1 0 0.159090906381607;1 0 0.136363640427589;1 0 0.113636367022991;1 0 0.0909090936183929;1 0 0.0681818202137947;1 0 0.0454545468091965;1 0 0.0227272734045982;1 0 0]);

%1983-2016,March
[fig2]=FigDistribution(longitude,latitude,March2_N);
set(gca,'CLim',[-0.169396762420483 0.073],'Colormap',...
    [0 1 1;0 0.976744174957275 1;0 0.953488349914551 1;0 0.930232584476471 1;0 0.906976759433746 1;0 0.883720934391022 1;0 0.860465109348297 1;0 0.837209284305573 1;0 0.813953459262848 1;0 0.790697693824768 1;0 0.767441868782043 1;0 0.744186043739319 1;0 0.720930218696594 1;0 0.69767439365387 1;0 0.67441862821579 1;0 0.651162803173065 1;0 0.627906978130341 1;0 0.604651153087616 1;0 0.581395328044891 1;0 0.558139562606812 1;0 0.534883737564087 1;0 0.511627912521362 1;0 0.488372087478638 1;0 0.465116292238235 1;0 0.441860467195511 1;0 0.418604642152786 1;0 0.395348846912384 1;0 0.372093021869659 1;0 0.348837196826935 1;0 0.325581401586533 1;0 0.302325576543808 1;0 0.279069781303406 1;0 0.255813956260681 1;0 0.232558146119118 1;0 0.209302321076393 1;0 0.18604651093483 1;0 0.162790700793266 1;0 0.139534890651703 1;0 0.116279073059559 1;0 0.0930232554674149 1;0 0.0697674453258514 1;0 0.0465116277337074 1;0 0.0232558138668537 1;0 0 1;0 1 0;1 0 1;1 0 0.944444417953491;1 0 0.888888895511627;1 0 0.833333313465118;1 0 0.777777791023254;1 0 0.722222208976746;1 0 0.666666686534882;1 0 0.611111104488373;1 0 0.555555582046509;1 0 0.5;1 0 0.444444447755814;1 0 0.388888895511627;1 0 0.333333343267441;1 0 0.277777791023254;1 0 0.222222223877907;1 0 0.16666667163372;1 0 0.111111111938953;1 0 0.0555555559694767;1 0 0]);

%1948-1982,April
[fig3]=FigDistribution(longitude,latitude,April1_N);
set(gca,'CLim',[-0.251778862401672 0.87941],'Colormap',...
    [0 1 1;0 0.923076927661896 1;0 0.846153855323792 1;0 0.769230782985687 1;0 0.692307710647583 1;0 0.615384638309479 1;0 0.538461565971375 1;0 0.461538463830948 1;0 0.384615391492844 1;0 0.307692319154739 1;0 0.230769231915474 1;0 0.15384615957737 1;0 0.0769230797886848 1;0 0 1;0 1 0;1 0 1;1 0 0.979166686534882;1 0 0.958333313465118;1 0 0.9375;1 0 0.916666686534882;1 0 0.895833313465118;1 0 0.875;1 0 0.854166686534882;1 0 0.833333313465118;1 0 0.8125;1 0 0.791666686534882;1 0 0.770833313465118;1 0 0.75;1 0 0.729166686534882;1 0 0.708333313465118;1 0 0.6875;1 0 0.666666686534882;1 0 0.645833313465118;1 0 0.625;1 0 0.604166686534882;1 0 0.583333313465118;1 0 0.5625;1 0 0.541666686534882;1 0 0.520833313465118;1 0 0.5;1 0 0.479166656732559;1 0 0.458333343267441;1 0 0.4375;1 0 0.416666656732559;1 0 0.395833343267441;1 0 0.375;1 0 0.354166656732559;1 0 0.333333343267441;1 0 0.3125;1 0 0.291666656732559;1 0 0.270833343267441;1 0 0.25;1 0 0.22916667163372;1 0 0.20833332836628;1 0 0.1875;1 0 0.16666667163372;1 0 0.14583332836628;1 0 0.125;1 0 0.10416666418314;1 0 0.0833333358168602;1 0 0.0625;1 0 0.0416666679084301;1 0 0.020833333954215;1 0 0]);
%1983-2016,April
[fig4]=FigDistribution(longitude,latitude,April2_N);
set(gca,'CLim',[-0.185743190327278 0.115],'Colormap',...
    [0 1 1;0 0.973684191703796 1;0 0.947368443012238 1;0 0.921052634716034 1;0 0.89473682641983 1;0 0.868421077728271 1;0 0.842105269432068 1;0 0.815789461135864 1;0 0.789473712444305 1;0 0.763157904148102 1;0 0.736842095851898 1;0 0.710526287555695 1;0 0.684210538864136 1;0 0.657894730567932 1;0 0.631578922271729 1;0 0.60526317358017 1;0 0.578947365283966 1;0 0.552631556987762 1;0 0.526315808296204 1;0 0.5 1;0 0.473684221506119 1;0 0.447368413209915 1;0 0.421052634716034 1;0 0.394736856222153 1;0 0.368421047925949 1;0 0.342105269432068 1;0 0.315789461135864 1;0 0.289473682641983 1;0 0.263157904148102 1;0 0.236842110753059 1;0 0.210526317358017 1;0 0.184210523962975 1;0 0.157894730567932 1;0 0.131578952074051 1;0 0.105263158679008 1;0 0.0789473652839661 1;0 0.0526315793395042 1;0 0.0263157896697521 1;0 0 1;0 1 0;1 0 1;1 0 0.95652174949646;1 0 0.91304349899292;1 0 0.869565188884735;1 0 0.826086938381195;1 0 0.782608687877655;1 0 0.739130437374115;1 0 0.695652186870575;1 0 0.652173936367035;1 0 0.60869562625885;1 0 0.56521737575531;1 0 0.52173912525177;1 0 0.47826087474823;1 0 0.434782594442368;1 0 0.391304343938828;1 0 0.347826093435287;1 0 0.304347813129425;1 0 0.260869562625885;1 0 0.217391297221184;1 0 0.173913046717644;1 0 0.130434781312943;1 0 0.0869565233588219;1 0 0.0434782616794109;1 0 0]);


%1948-1982,May
[fig5]=FigDistribution(longitude,latitude,May1_N);
set(gca,'CLim',[-0.209152257961567 0.8],'Colormap',...
    [0 1 1;0 0.916666686534882 1;0 0.833333313465118 1;0 0.75 1;0 0.666666686534882 1;0 0.583333313465118 1;0 0.5 1;0 0.416666656732559 1;0 0.333333343267441 1;0 0.25 1;0 0.16666667163372 1;0 0.0833333358168602 1;0 0 1;0 1 0;1 0 1;1 0 0.979591846466064;1 0 0.959183692932129;1 0 0.938775539398193;1 0 0.918367326259613;1 0 0.897959172725677;1 0 0.877551019191742;1 0 0.857142865657806;1 0 0.836734712123871;1 0 0.816326558589935;1 0 0.795918345451355;1 0 0.775510191917419;1 0 0.755102038383484;1 0 0.734693884849548;1 0 0.714285731315613;1 0 0.693877577781677;1 0 0.673469364643097;1 0 0.653061211109161;1 0 0.632653057575226;1 0 0.61224490404129;1 0 0.591836750507355;1 0 0.571428596973419;1 0 0.551020383834839;1 0 0.530612230300903;1 0 0.510204076766968;1 0 0.489795923233032;1 0 0.469387769699097;1 0 0.448979586362839;1 0 0.428571432828903;1 0 0.408163279294968;1 0 0.38775509595871;1 0 0.367346942424774;1 0 0.346938788890839;1 0 0.326530605554581;1 0 0.306122452020645;1 0 0.28571429848671;1 0 0.265306115150452;1 0 0.244897961616516;1 0 0.224489793181419;1 0 0.204081639647484;1 0 0.183673471212387;1 0 0.16326530277729;1 0 0.142857149243355;1 0 0.122448980808258;1 0 0.102040819823742;1 0 0.0816326513886452;1 0 0.061224490404129;1 0 0.0408163256943226;1 0 0.0204081628471613;1 0 0]);
%1983-2016,April
[fig6]=FigDistribution(longitude,latitude,May2_N);
set(gca,'CLim',[-0.310229081449239 0.25166],'Colormap',...
    [0 1 1;0 0.970588207244873 1;0 0.941176474094391 1;0 0.911764681339264 1;0 0.882352948188782 1;0 0.852941155433655 1;0 0.823529422283173 1;0 0.794117629528046 1;0 0.764705896377563 1;0 0.735294103622437 1;0 0.705882370471954 1;0 0.676470577716827 1;0 0.647058844566345 1;0 0.617647051811218 1;0 0.588235318660736 1;0 0.558823525905609 1;0 0.529411792755127 1;0 0.5 1;0 0.470588237047195 1;0 0.441176474094391 1;0 0.411764711141586 1;0 0.382352948188782 1;0 0.352941185235977 1;0 0.323529422283173 1;0 0.294117659330368 1;0 0.264705896377563 1;0 0.235294118523598 1;0 0.205882355570793 1;0 0.176470592617989 1;0 0.147058829665184 1;0 0.117647059261799 1;0 0.0882352963089943 1;0 0.0588235296308994 1;0 0.0294117648154497 1;0 0 1;0 1 0;1 0 1;1 0 0.962962985038757;1 0 0.92592591047287;1 0 0.888888895511627;1 0 0.851851880550385;1 0 0.814814805984497;1 0 0.777777791023254;1 0 0.740740716457367;1 0 0.703703701496124;1 0 0.666666686534882;1 0 0.629629611968994;1 0 0.592592597007751;1 0 0.555555582046509;1 0 0.518518507480621;1 0 0.481481492519379;1 0 0.444444447755814;1 0 0.407407402992249;1 0 0.370370358228683;1 0 0.333333343267441;1 0 0.296296298503876;1 0 0.259259253740311;1 0 0.222222223877907;1 0 0.185185179114342;1 0 0.148148149251938;1 0 0.111111111938953;1 0 0.0740740746259689;1 0 0.0370370373129845;1 0 0]);


