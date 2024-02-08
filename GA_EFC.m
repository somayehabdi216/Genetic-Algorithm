
function  best_fit=GA_EFC()
newparameter;
npop =10;
maxiter = 50;
pc= 0.5;
nmut = round (npop* pc/2);
pm= 1- pc;
ncross = round (npop * pm);
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
%    breakloop=breakloop+1;
%    if (breakloop==5000) 
%        if(f_index>3)
%            f_index
%           [ value  , index ]= sort ([pop.fit]);
%           pop = pop(index);
%           disp('best');
%           npop=f_index-1;
%           best_fit=pop(1).fit
%           pop(1).par
%           pc= 0.5;
%           nmut = round (npop* pc/2)
%           pm= 1- pc;
%           ncross = round (npop * pm)
%           %disp('ncross')
%           %ncross
%           %break  
%          return
%        else 
%            disp('infeasible')
%           return
%        end
%    end
end


%main LOOP
BEST = zeros( maxiter, 1);
MEAN = zeros( maxiter, 1);
for iter=  1 : maxiter
    % CrossOver
    %if (ncross>=2)
      crosspop= repmat(empty, ncross,1);
      crosspop = uniformcrossover(pop,npop,ncross);
    %end

    % Mutation 
    %    if (nmut>=1)
         mutpop= repmat(empty, nmut,1);
         mutpop = mutation1(pop,npop,ncross);
    %    end

   % Merge
    pop= [pop; crosspop; mutpop];
  % pop= [pop; crosspop];
     % Sort
    [ value  , index ]= sort ([pop.fit]);
    
    pop = pop(index);
    
     %  select Top 100 with minimum fitnees
   
    pop= pop(1:npop);
    
    gpop = pop(1);
    BEST ( iter) = gpop.fit;
%     MEAN (iter) =  mean ([pop.fit]);
%     disp ('**************************************************************');
%     disp ( [' Iter = '  num2str(iter)] );
%     disp ( [' Best = '  num2str(BEST (iter))]);
%     disp ('**************************************************************');
    
end
    best_fit=gpop.fit;
% figure (1)
% plot (BEST, '-b*');
% hold on
% plot (MEAN,'p');
% 
% disp ([ ' Time = ' num2str(toc)]);
% gpop.par    
 disp ([ ' Time = ' num2str(toc)]);
end
