function fit = fitness (sol)
    newparameter;
    VSkjl= zeros(ncloud, nvm, indexvm);
    VFkjl= zeros(ncloud, nvm, indexvm);
       for i=1:ntask
        cloud_index= sol(2,i);
        vm_type= sol(3, i);
        vm_index= sol(4,i);
        if VSkjl(cloud_index,vm_type,vm_index) == 0 || sol(5,i) < VSkjl(cloud_index,vm_type,vm_index)
            VSkjl(cloud_index,vm_type,vm_index) = sol (5,i);
        end
        if (sol(5,i) + sol (6,i)) > VFkjl(cloud_index,vm_type,vm_index)
            VFkjl(cloud_index,vm_type,vm_index) = sol (5,i)+sol(6,i);
        end
    end
    TPkjl= ceil(VFkjl-VSkjl);
    executioncost=0;
    for k=1:ncloud
        for j=1:vm_type
            for l=1:indexvm
             executioncost = executioncost + TPkjl(k,j,l) * pr(k,j);
            end
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

               
