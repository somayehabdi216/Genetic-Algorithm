function fit = fitness1 (sol)
    newparameter;
   % VSkjl= zeros(ncloud, nvm, indexvm);
   % VFkjl= zeros(ncloud, nvm, indexvm);
    VS_fog_jl= zeros(n_vm_fog, indexvm);
    VF_fog_jl= zeros(n_vm_fog, indexvm);
    VS_cloud_jl= zeros(n_vm_cloud, indexvm);
    VF_cloud_jl= zeros(n_vm_cloud, indexvm);

    for i=1:ntask
        cloud_index= sol(2,i);
        vm_type= sol(3, i);
        vm_index= sol(4,i);
        if  cloud_index==1
            continue;
        elseif  cloud_index==2  
               if VS_fog_jl(vm_type,vm_index) == 0 || sol(5,i) < VS_fog_jl(vm_type,vm_index)
                 VS_fog_jl(vm_type,vm_index) = sol (5,i);
               end
               if (sol(5,i) + sol (6,i)) > VF_fog_jl(vm_type,vm_index)
                   VF_fog_jl(vm_type,vm_index) = sol(5,i)+sol(6,i);
               end
        elseif  cloud_index==3
             if VS_cloud_jl(vm_type,vm_index) == 0 || sol(5,i) < VS_cloud_jl(vm_type,vm_index)
                 VS_cloud_jl(vm_type,vm_index) = sol (5,i);
             end
               if (sol(5,i) + sol (6,i)) > VF_cloud_jl(vm_type,vm_index)
                   VF_cloud_jl(vm_type,vm_index) = sol(5,i)+sol(6,i);
               end
        end

    end
    %TPkjl= ceil(VFkjl-VSkjl);
    TP_fog_jl= ceil(VF_fog_jl-VS_fog_jl);
    TP_cloud_jl= ceil(VF_cloud_jl-VS_cloud_jl);
    executioncost=0;
   
        for j=1:n_vm_fog
            for l=1:indexvm
             executioncost = executioncost + TP_fog_jl(j,l) * pr_fog(j);
            end
        end
   
        for j=1:n_vm_cloud
            for l=1:indexvm
             executioncost = executioncost + TP_cloud_jl(j,l) * pr_cloud(j);
            end
        end
   
    
    datatransfercost =0;
    for i=1:ntask
       pre = pred {i};
       s= length(pre);
       if ( s>0 )
       for j=1:s
           if samecloud(sol, i , j)==1
            datatransfercost = datatransfercost + ods(j)*dtc; 
           end
       end
       end
    end

     executioncost;

   datatransfercost;
    
    fit= executioncost + datatransfercost;
end

               
