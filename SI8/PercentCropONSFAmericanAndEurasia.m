function [Per]=PercentCropONSFAmericanAndEurasia(data5_window,num,Land,idx1)

 %k1=1,表示北美,其他数字表示欧亚，我们用2表示吧
k1=1;
if k1==num
    for i=1:40
        temp=data5_window{1, i};
        temp(idx1)=nan;
        temp5=temp(:,1:650);
%         pcolor(temp)
%         shading flat
        Land(idx1)=nan;    
        land=Land(:,1:650);
%         pcolor(land)
%         shading flat
    %     pcolor(temp5)
    %     shading flat
        idx=find(temp5>0);
        land_num=land(idx);
        a11=land_num(:);
        a11(find(isnan(a11)))=[];
        a22=find(land>0);
        Per(i)=length(a11)/length(a22);

    end

else
    
    for i=1:40
        temp=data5_window{1, i};
        temp(idx1)=nan;
        temp5=temp(:,651:end);
        Land(idx1)=nan;
        land=Land(:,651:end);
%         pcolor(land)
%         shading flat
%          pcolor(temp5)
%          shading flat
        idx=find(temp5>0);
        land_num=land(idx);
        a11=land_num(:);
        a11(find(isnan(a11)))=[];
        a22=find(land>0);
        Per(i)=length(a11)/length(a22);

    end
    
end





