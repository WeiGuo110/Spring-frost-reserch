function  [NA_mean3,error3]=MeanPriobability(M31_P,M32_P,num)

k=1;
if k==num

    x1=M31_P(:,1:650);
    x11=x1(:);
    x11(find(isnan(x11)))=[];
    
    

    x2=M32_P(:,1:650);
    x22=x2(:);
    x22(find(isnan(x22)))=[];
    NA_mean3=[mean(x11),mean(x22)];
    error3=[std(x11),std(x22)];
else
    x1=M31_P(:,651:end);
    x11=x1(:);
    x11(find(isnan(x11)))=[];

    x2=M32_P(:,651:end);
    x22=x2(:);
    x22(find(isnan(x22)))=[];
    NA_mean3=[mean(x11),mean(x22)];
    error3=[std(x11),std(x22)];
    
end

end

    