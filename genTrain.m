function y = genTrain(IH,out,target,input,HO)
    [m n] =size(IH);
    y=rand(m,n);
    for i =1:m
            
        y(i,1)=IH(i,1)-(out -target)*out*(1-out)*HO(i,1)*input(1,1)*0.05;
        y(i,2)=IH(i,2)-(out -target)*out*(1-out)*HO(i,1)*input(2,1)*0.05;
    end
end