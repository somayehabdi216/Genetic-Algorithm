function rt = runtime1 (sol, taski)
    newparameter;
   CP_index= sol(2,taski);
    I_index= sol(3, taski);
     if CP_index==1
      rt= et(taski)/pf_edge(1);
    elseif CP_index==2
         rt= et(taski)/pf_fog(I_index);
    elseif CP_index==3    
         rt= et(taski)/pf_cloud(I_index);
     end
end