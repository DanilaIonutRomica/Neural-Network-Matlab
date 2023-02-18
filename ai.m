IH = rand(4,2);
HO = rand(4,1);
input= [0 ; 20];
hidden = rand(1,4);
output= 0;


mse=0;
px=[0];
py=[0];
pz=[0];
for k=1:10000
    
    input=-300 + (300+300)*rand(2,1);
    if input(2,1)>0
        target = 1;
    else
        target = 0;
    end
    hidden= net(IH,input);
    hidden=activateNeuron(hidden);
    output= net(hidden.',HO);
    output=activateNeuron(output);
    if target ==0
        mse =mse+0;
    else
        mse=mse+(target-output)*(target-output);
    end
    px(k+1)=mse;
    py(k+1)=k;
    pz(k+1)=abs(target-output);
    %if output > 0.5 && target == 1
     %   py(k+1)=1;
    %else
     %   py(k+1)=0;
    %end
    %back propagation part
    HO=FF(HO,output, target, hidden);
    IH=FF1(IH,output, target,input, HO);
    
    
end
%plot(py,px)


x=[0]
y=[0]
mse=0;
errAfterTraining=0
for k=1:10000
    
    input=-800 + (800+800)*rand(2,1);
    if input(2,1)>0 

        target = 1;
    else
        target = 0;
    end
    hidden= net(IH,input);
    hidden=activateNeuron(hidden);
    output= net(hidden.',HO);
    output=activateNeuron(output);
    if target ~= output
        errAfterTraining=errAfterTraining+1
    end
    if target ==0
        mse =mse+0;
    else
        mse=mse+(target-output)*(target-output);
    end
    %errAfterTraining=errAfterTraining+ 0.5*(target-output)*(target-output);
    %back propagation part
    HO=FF(HO,output, target, hidden);
    IH=FF1(IH,output, target,input, HO);
    x(k+1)=k;
    y(k+1)=mse;
    
end
plot(x,y)
errAfterTraining/10000
%sum(pz)
%pz