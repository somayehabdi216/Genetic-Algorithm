function dtt = DTT (sol, taski, taskt)
    newparameter;
    cloud_index= sol(2,taskt);
    vm_index= sol(3, taskt);
    dtt= tau(sol,taski,taskt)* ods(taskt)/bw(cloud_index, vm_index) + samecloud(sol,taski, taskt)*ods(taskt)/bwc;
end