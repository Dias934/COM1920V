function graph_window(Ax, limits, time, NAm, val)
    lMin=limits(1);
    lMax=time(end);
    NAmBit=NAm;    %número de amostras num tempo de bit
    nBits=numel(time)/NAmBit;
    val=round(val, 3);
    N=10;               %número de bits a apresentar
    minThreshold=1/(nBits/N); 
    if(val<=minThreshold)
        lMax=lMax*minThreshold;
    else
        lMin=lMax*(val-minThreshold);
        lMax=lMax*val;
    end
    Ax.XLim=[lMin lMax];
end

