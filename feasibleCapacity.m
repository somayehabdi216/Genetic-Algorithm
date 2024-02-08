function flag = feasibleCapacity (sol)
    newparameter;
    flag=1;
   rented_vm = zeros(nvm, indexvm);
    for i=1:ntask
        cloud_index= sol(2,i);
        vm_type= sol(3, i);
        index_vm = sol(4,i);
        if (cloud_index == 1)
            rented_vm(vm_type,index_vm)=1;
        end
    end
    totalrentedvm= sum(rented_vm);
    allrented= sum(totalrentedvm);
    if allrented > NK
        flag= 0;
    end
    
end

    