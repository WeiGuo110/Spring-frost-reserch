
function [M31_P,M32_P]=CompareISF2PeriodPrincton(data3_window)

for i=1:40
    M=zeros(360,1440);
%     temp=data3_window{1,i};
%     temp=data4_window{1,i};
    temp=data3_window{1,i};
    idx1=find(temp>0);
    idx2=find(isnan(temp));
    M(idx2)=nan;
    M(idx1)=1;
    M3(:,:,i)=M;
end

for i=1:360
    for j=1:1440
        temp=squeeze(M3(i,j,1:20));
        if length(find(isnan(temp)))==20
            M31_P(i,j)=nan;
        else
            idx=find(temp==1);
            M31_P(i,j)=length(idx)/20;
        end
    end
end

for i=1:360
    for j=1:1440
        temp=squeeze(M3(i,j,21:40));
        if length(find(isnan(temp)))==20
            M32_P(i,j)=nan;
        else
            idx=find(temp==1);
            M32_P(i,j)=length(idx)/20;
        end
    end
end
