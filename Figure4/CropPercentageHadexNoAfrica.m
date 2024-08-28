
function [Per1]=CropPercentageHadexNoAfrica(may_slope,num,T2,idx1)
k1=1;
if k1==num
    for i=48:87
        temp=may_slope(:,:,i);
        temp(idx1)=nan;
        temp5=temp(:,1:end/2-7);
        T2(idx1)=nan;
        land=T2(:,1:end/2-7);
        pcolor(land)
        shading flat
        pcolor(temp5)
        shading flat
        idx=find(temp5>0);
        land_num=land(idx);
        a11=land_num(:);
        a11(find(isnan(a11)))=[];
        a22=find(land>0);
        Per(i)=length(a11)/length(a22);
    end
    Per1=Per(48:87);
    
else

    for i=48:87
        temp=may_slope(:,:,i);
        temp(idx1)=nan;
        temp5=temp(:,end/2-7:end);
        T2(idx1)=nan;
        land=T2(:,end/2-7:end);
        pcolor(land)
        shading flat
        pcolor(temp5)
        shading flat
        idx=find(temp5>0);
        land_num=land(idx);
        a11=land_num(:);
        a11(find(isnan(a11)))=[];
        a22=find(land>0);
        Per(i)=length(a11)/length(a22);
    end
     Per1=Per(48:87);
    
end

