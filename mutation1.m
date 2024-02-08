function mutpop = mutation (pop, npop,nmut)
    newparameter;
     empty.par =[];
     empty.fit=inf;
     mutpop= repmat(empty,nmut,1);
     iter=0;
    for m=1:nmut
       % h= randi( [1  npop]);
       % sol= pop(h).par;
       h=tournamentSelection(pop,3);
       sch_task= h.par;
       k= randi([1 ntask]);

     if TS(k)==1 
        sch_task(2,k)=1;
        if ramtask(k)<=ram_edge(1)
            sch_task (3,k)=1;   %****** selceting instance type for the private task
            sch_task (4,k)= 1;  %****** selceting  VM index for the private task 
        else  
              continue    %****** ram constraint is not satisfied for the private task    
           
        end     
    elseif TS(k)==2
        sch_task(2,k)= randi(2);
    elseif TS(k)==3 
        sch_task(2,k)= randi(3);
    end

 %**********************************************************
    %*******check the ram constraint
    if sch_task(2,k)==1
        if ramtask(k)<=ram_edge
            sch_task (3,k)=1;   %****** selceting instance type for the private task
            sch_task (4,k)= 1;  %****** selceting  VM index for the private task 
        elseif TS(k)==2
             sch_task(2,k)=2;   %****** selceting  layer index for the semi-private task again
         elseif TS(k)==3     
             sch_task(2,k)=(3-2)*randi(1)+2;  %****** selceting  layer index for the public task again
        end 
    end 

  %**********************************************************
  
  if sch_task(2,k)==2    % ****** selceting instance type and node index   in fog layer
      sch_task (3,k)=randi(n_vm_fog);   
      sch_task (4,k)= randi(indexvm);  
  elseif sch_task(2,k)==3  % ****** selceting instance type  and node index in the cloud layer
      sch_task (3,k)=randi(n_vm_cloud);   
      sch_task (4,k)= randi(indexvm); 
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
       
 if feasibleDeadline(sch_task)
           iter=iter+1;
           mutpop(iter).par=sch_task;
           mutpop(iter).fit=fitness1(sch_task);
           % h1.par=Sol1;
           % h1.fit = fitness1(Sol1);
       
                  
     end

% 
%        h.par=sch_task;
%        h.fit=fitness1(h.par);
    end
end
