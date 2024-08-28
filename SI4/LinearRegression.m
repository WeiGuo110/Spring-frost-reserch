function [Slope_Year,Pavue_Year]=LinearRegression(data)

% data=data1;
% x=1:size(data,3);
for i=1:size(data,1)
%     disp(i);
    for j=1:size(data,2)
        y=squeeze(data(i,j,:));
        idx=find(isnan(y));
        if length(idx)==size(data,3)
            Slope_Year(i,j)=nan;
            Pavue_Year(i,j)=nan;
        else
            x=1:size(data,3);
            x(idx)=[];
            y(idx)=[];
            datafit=LinearModel.fit(x,y);
            parameter=table2array(datafit.Coefficients);
            Rsquare=datafit.Rsquared.Ordinary;
            k11=parameter(2,1);
            p11=parameter(2,4);
            R2=datafit.Rsquared.Ordinary;
            Slope_Year(i,j)=k11;
            Pavue_Year(i,j)=p11;
            
        end
    end
end
end


