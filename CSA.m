function  best_fit=CSA()
newparameter;
npop =1;
tic 
empty.par =[];
empty.fit=inf;
pop = repmat( empty, npop,1);
initialsol= zeros(6, ntask);
feasiblesol = zeros (1,npop);
Feasible=1;

f_index = 1;
breakloop=0;
while ( f_index <=npop) 

    sol = Initialpop(n_vm_edge,n_vm_fog,n_vm_cloud, indexvm,Feasible);
    if feasibleDeadline(sol)
        pop(f_index).par= sol;
        pop(f_index).fit = fitness1(sol);
        f_index = f_index +1;
                
    end
   
  
end
  [ value  , index ]= sort ([pop.fit]);
          
          pop = pop(index);
         % disp('best of iterative_ random search')
          best_fit=pop(1).fit; 
end
           