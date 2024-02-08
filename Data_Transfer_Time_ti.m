function dtt = Data_Transfer_Time_ti (sol, taski, taskt)
    newparameter;
    CP_index_t= sol(2,taskt);
    I_index_t= sol(3, taskt);
    vm_index_t= sol(4, taskt);

    CP_index_i= sol(2,taski);
    I_index_i= sol(3, taski);
    vm_index_i= sol(4, taski);

    if (CP_index_t==CP_index_i) && (vm_index_t==vm_index_i) && (I_index_t==I_index_i)
          dtt=0; 
    elseif CP_index_t==CP_index_i
        if CP_index_t==1
         dtt=ods(taskt)/bw_edge(I_index_t);
        elseif CP_index_t==2
           dtt=ods(taskt)/bw_fog(I_index_t);
        else
            dtt=ods(taskt)/bw_cloud(I_index_t);
        end
    elseif  CP_index_t~=CP_index_i
       if (CP_index_t==1 || CP_index_i==1 ) && (CP_index_i==2 || CP_index_t==2) 
          dtt=ods(taskt)/bw_edge_fog;
       elseif (CP_index_t==2 || CP_index_i==2 ) && (CP_index_i==3 || CP_index_t==3) 
          dtt=ods(taskt)/bw_fog_cloud;
       elseif (CP_index_t==1 || CP_index_i==1 ) && (CP_index_i==3 || CP_index_t==3) 
              dtt=ods(taskt)/bw_edge_cloud;
       end
    end
    
end