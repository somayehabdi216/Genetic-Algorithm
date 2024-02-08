function [ FeasibleSol ] = newsch(nvm, indexvm)
 newparameter;

 %[p_ccu, cloud_id, vm_id] =sort_ppccu(ppccu,ncloud,nvm);
%instance_max=4;

sch_task=zeros(4,ntask);
for i=1 : ntask
    sch_task(1,i)=i;
    sch_task(2,i)= randi(ncloud);
    sch_task (3,i)= randi (nvm);
    sch_task (4,i)= randi (indexvm);
end
IsCalculatedStartTime = zeros(1,ntask);
for i=1: ntask
    sch_task(6,i)= runtime(sch_task, i);
    %**** Calculate Start time
    pre= pred{i};
    s= length(pre);
    %****** Calculate Start time of predecessors of taski
    for j=1 : s
        if IsCalculatedStartTime(pre{j}) == 0
            sch_task(5,pre{j})= starttime(sch_task,pre{j});
            IsCalculatedStartTime(1,pre{j})=1;
        end
    end
    %*******
    sch_task(5,i)= starttime(sch_task,i);
    IsCalculatedStartTime (1,i)=1;
end
FeasibleSol= sch_task;