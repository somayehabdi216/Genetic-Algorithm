clc
clear 
close all
newparameter;
npop =20;
maxiter = 100;
pc= 0.2;
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

while ( f_index <=npop) 

    sol = newsch(nvm,indexvm);
    %if feasible(sol)
        pop(f_index).par= sol;
        pop(f_index).fit = fitness(sol);
        f_index = f_index +1;
                
    %end
end


%main LOOP
BEST = zeros( maxiter, 1);
MEAN = zeros( maxiter, 1);
for iter=  1 : maxiter
    % CrossOver
    crosspop= repmat(empty, ncross,1);
    crosspop = crossover(pop,npop,ncross);
    % Mutation 
    mutpop= repmat(empty, nmut,1);
    mutpop = mutation(pop,npop,nmut);
   % Merge
    pop= [pop; crosspop; mutpop];
   % Sort
    [ value  , index ]= sort ([pop.fit]);
    
    pop = pop(index);
    
     %  select Top 100 with minimum fitnees
   
    pop= pop(1:npop);
    
    gpop = pop(1);
    BEST ( iter) = gpop.fit;
    MEAN (iter) =  mean ([pop.fit]);
    disp ('**************************************************************')
    disp ( [' Iter = '  num2str(iter)] )
    disp ( [' Best = '  num2str(BEST (iter))])
    disp ('**************************************************************')
    
end
figure (1)
plot (BEST, '-b*');
hold on
plot (MEAN,'p');

disp ([ ' Time = ' num2str(toc)]);
gpop.par    
