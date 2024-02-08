function flag = feasibleSecurity (sol)
    newparameter;
    flag=1;
    for i=1:ntask
        cloud_index= sol(2,i);
        vm_index= sol(3, i);
        if (TS(i)<RS(cloud_index, vm_index))
            flag=0;
        end
    end
end

    