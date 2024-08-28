
function [M31_P,M32_P]=CompareISF2PeriodPrinctonHad(may_slope,idx22)

for i=48:87
    M=zeros(72,192);
%     temp=data3_window{1,i};
%     temp=data4_window{1,i};
    temp=may_slope(:,:,i);
    idx1=find(temp>0);
    idx2=find(isnan(temp));
    M(idx2)=nan;
    M(idx1)=1;
    M3(:,:,i-47)=M;
end

for i=1:72
    for j=1:192
        temp=squeeze(M3(i,j,1:20));
        if length(find(isnan(temp)))==20
            M31_P(i,j)=nan;
        else
            idx=find(temp==1);
            M31_P(i,j)=length(idx)/20;
        end
    end
end

M31_P(idx22)=nan;

for i=1:72
    for j=1:192
        temp=squeeze(M3(i,j,21:40));
        if length(find(isnan(temp)))==20
            M32_P(i,j)=nan;
        else
            idx=find(temp==1);
            M32_P(i,j)=length(idx)/20;
        end
    end
end

M32_P(idx22)=nan;

end






% function [Per1]=CropPercentageHadexNoAfrica(may_slope,num,T2,idx1)
% k1=1;
% if k1==num
%     for i=48:87
%         temp=may_slope(:,:,i);
%         temp(idx1)=nan;
%         temp5=temp(:,1:end/2-7);
%         T2(idx1)=nan;
%         land=T2(:,1:end/2-7);
%         pcolor(land)
%         shading flat
%         pcolor(temp5)
%         shading flat
%         idx=find(temp5>0);
%         land_num=land(idx);
%         a11=land_num(:);
%         a11(find(isnan(a11)))=[];
%         a22=find(land>0);
%         Per(i)=length(a11)/length(a22);
%     end
%     Per1=Per(48:87);
%     
% else
% 
%     for i=48:87
%         temp=may_slope(:,:,i);
%         temp(idx1)=nan;
%         temp5=temp(:,end/2-7:end);
%         T2(idx1)=nan;
%         land=T2(:,end/2-7:end);
%         pcolor(land)
%         shading flat
%         pcolor(temp5)
%         shading flat
%         idx=find(temp5>0);
%         land_num=land(idx);
%         a11=land_num(:);
%         a11(find(isnan(a11)))=[];
%         a22=find(land>0);
%         Per(i)=length(a11)/length(a22);
%     end
%      Per1=Per(48:87);
%     
% end
% 
% 
% 







