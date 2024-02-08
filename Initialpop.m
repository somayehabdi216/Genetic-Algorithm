function [ FeasibleSol ] = Initialpop(n_vm_edge,n_vm_fog,n_vm_cloud, indexvm,Feasible)
 newparameter;

 %[p_ccu, cloud_id, vm_id] =sort_ppccu(ppccu,ncloud,nvm);
%instance_max=4;

sch_task=zeros(4,ntask);
for i=1 : ntask
    sch_task(1,i)=i;

    %**********************************************************
    %****** selceting computing layer
    if TS(i)==1 
        sch_task(2,i)=1;
        if ramtask(i)<=ram_edge(1)
            sch_task (3,i)=1;   %****** selceting instance type for the private task
            sch_task (4,i)= 1;  %****** selceting  VM index for the private task 
        else  
            Feasible=0;        %****** ram constraint is not satisfied for the private task    
           break
        end     
    elseif TS(i)==2
        sch_task(2,i)= randi(2);
    elseif TS(i)==3 
        sch_task(2,i)= randi(3);
    else   
         disp (' the security tag is not correct')
         break
    end

 %**********************************************************
    %*******check the ram constraint
    if sch_task(2,i)==1
        if ramtask(i)<=ram_edge
            sch_task (3,i)=1;   %****** selceting instance type for the private task
            sch_task (4,i)= 1;  %****** selceting  VM index for the private task 
        elseif TS(i)==2
             sch_task(2,i)=2   %****** selceting  layer index for the semi-private task again
         elseif TS(i)==3     
             sch_task(2,i)=(3-2)*randi(1)+2;  %****** selceting  layer index for the public task again
        end 
    end 

  %**********************************************************
  
  if sch_task(2,i)==2    % ****** selceting instance type and VM index   in fog layer
      sch_task (3,i)=randi(n_vm_fog);   
      sch_task (4,i)= randi(indexvm);  
  elseif sch_task(2,i)==3  % ****** selceting instance type  and VM index in the cloud layer
      sch_task (3,i)=randi(n_vm_cloud);   
      sch_task (4,i)= randi(indexvm); 
  end
          
end
%sch_task

IsCalculatedStartTime = zeros(1,ntask);
for i=1: ntask
    sch_task(6,i)= runtime1(sch_task, i);    %**** Calculate run time
    %**** Calculate Start time
    pre= pred{i};
    s= length(pre);
    %****** Calculate Start time of predecessors of taski
    for j=1 : s
        if IsCalculatedStartTime(pre{j}) == 0
            sch_task(5,pre{j})= starttime1(sch_task,pre{j});
            IsCalculatedStartTime(1,pre{j})=1;
        end
    end
    %******* 
     sch_task(5,i)= starttime1(sch_task,i);
     IsCalculatedStartTime (1,i)=1;
     

end
 FeasibleSol= sch_task;