function y = activateNeuron(neuronList)
    [m n] = size(neuronList);
    for i=1:m 
        for j=1:n
            y(i,j)=1/(1+exp(-neuronList(i,j)));
        end
    end
end