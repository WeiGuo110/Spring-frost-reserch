function  [March1_N]=RestorePixel(data_label,March1)

data_ref=data_label(73:end,:);
data1=data_ref;
data1(find(data1>-10000))=1;
data1(find(isnan(data1)))=0;
% pcolor(data1)
% shading flat

March1_N=March1(73:end,:);
data2=March1_N;
data2(find(data2>-10000))=1;
data2(find(isnan(data2)))=0;
% pcolor(data2)
% shading flat

data3=data1+data2;
data3(find(data3==0))=nan;
data3(find(data3>0))=0;
% pcolor(data3)
% shading flat

%找出二者相同的位置，并把确实大陆的值补充上
%找出位置
March1_N=March1(73:end,:);
% pcolor(March1_N)
% shading flat
idx1=find(March1_N>-100);

data3(idx1)=nan;
% pcolor(data3)
% shading flat

idx2=find(data3==0);
%填补值
March1_N=March1(73:end,:);
March1_N(idx2)=0;


end
