function y = FF(HO,out,target,hiddenNeurons)
    [m n] =size(HO);
    y=rand(m,1);
    for i =1:m
        y(i,1)=HO(i,1)-(out -target)*out*(1-out)*hiddenNeurons(i,1)*0.25;
    end
end