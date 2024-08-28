
function [March_Number_SF_DSF,Rsquare,slope,pvale]=DecreasedSpringFrost(filename,num,SF3_1,SF3_2)

% March_data1=load('March_data_SF.mat');
March_data1=load(filename);
March_data=March_data1.datasset;

if num==1
    for i=1:35
        temp31_number_SF=March_data(:,:,i);
        idx=find(SF3_1<0);
        temp=temp31_number_SF(idx);
        temp(find(isnan(temp)))=[];
        March_Number_SF_DSF(i)=sum(temp);
    end

    x=1948:1982;
    y=March_Number_SF_DSF;
    datafit=LinearModel.fit(x,y);
    parameter=table2array(datafit.Coefficients);
    Rsquare=datafit.Rsquared.Ordinary;
    slope=parameter(2,1);
    pvale=parameter(2,4);
else
    for i=36:69
        temp31_number_SF=March_data(:,:,i);
        idx=find(SF3_2<0);
        temp=temp31_number_SF(idx);
        temp(find(isnan(temp)))=[];
        March_Number_SF_DSF(i-35)=sum(temp);
    end

    x=1983:2016;
    y=March_Number_SF_DSF;
    datafit=LinearModel.fit(x,y);
    parameter=table2array(datafit.Coefficients);
    Rsquare=datafit.Rsquared.Ordinary;
    slope=parameter(2,1);
    pvale=parameter(2,4);
    

end






