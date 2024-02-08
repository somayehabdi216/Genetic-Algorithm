function st = starttime1(sol, taski)
    newparameter;
    pre= pred {taski};
    s= length (pre);
    if s==0
        s=1;
        st=0;
    else
        pathTime = zeros(1,s);
        for i=1:s
            starttimetaskt= sol ( 5, pre{i}) ;
            runtimetaskt= sol (6, pre{i});
            %dtt_taskt= DTT(sol, taski, pre {i});
            dtt_taskt= Data_Transfer_Time_ti(sol, taski, pre {i});
            pathTime (i)=starttimetaskt+runtimetaskt+dtt_taskt;
        end
        % disp('data tarnsfer')
        st= max(pathTime);
    end
   end

