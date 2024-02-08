function rt = runtime (sol, taski)
    newparameter;
    cloud_index= sol(2,taski);
    vm_index= sol(3, taski);
    rt= et(taski)/(pf(cloud_index, vm_index)* min( core(cloud_index,vm_index) , Mu(taski)));
    
end