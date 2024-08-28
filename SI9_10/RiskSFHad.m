function  [land_risk]=RiskSFHad(data3_window,Land,num)

pcolor(Land)
shading flat


for i=1:40
    temp3=data3_window(:,:,i);
    idx=find(temp3>0);
    temp_land=Land;
    temp_land(find(temp_land>-10000))=0;
    temp_land(idx)=1;
    
    temp_land1=Land;
    temp_land1(find(temp_land1>-10000))=1;
    temp_land2=temp_land+temp_land1;
    temp_land2(find(temp_land2<2))=nan;
    temp_land2(find(temp_land2==2))=1;
    
    
    
    Data_land_3(:,:,i)=temp_land2;
end

kk=20;
if kk==num
    for i=1:72

        for j=1:192
            a1=squeeze(Data_land_3(i,j,1:20));
            if length(find(isnan(a1)))==20
                land_risk(i,j)=nan;
            else
                a1(find(isnan(a1)))=[];
                land_risk(i,j)=sum(a1)/20;

            end

        end
    end
    
else
    
    for i=1:72

        for j=1:192  
            a1=squeeze(Data_land_3(i,j,21:40));
            if length(find(isnan(a1)))==20
                land_risk(i,j)=nan;
            else
                a1(find(isnan(a1)))=[];
                land_risk(i,j)=sum(a1)/20;

            end

        end
    end
end
 

end

