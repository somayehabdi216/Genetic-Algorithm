function flag = feasibleDeadline (sol)
    newparameter;
    flag=1;
     if sol(5,ntask) + sol(6, ntask)>Dl

        flag= 0;
    end
    
end

    