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

%�ҳ�������ͬ��λ�ã�����ȷʵ��½��ֵ������
%�ҳ�λ��
March1_N=March1(73:end,:);
% pcolor(March1_N)
% shading flat
idx1=find(March1_N>-100);

data3(idx1)=nan;
% pcolor(data3)
% shading flat

idx2=find(data3==0);
%�ֵ
March1_N=March1(73:end,:);
March1_N(idx2)=0;


end
