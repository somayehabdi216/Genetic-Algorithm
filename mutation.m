function pop = mutation (pop, npop,nmut)
    newparameter;
    for i=1:nmut
       % h= randi( [1  npop]);
       % sol= pop(h).par;
       h=tournamentSelection(pop,5);
       sol= h.par;
       j= randi([1 ntask]);
       sol (3,j)= randi(nvm);
       sol(4,j) = randi(indexvm);
        %pop (h).par=sol;
       % pop(h).fit=  fitness(pop(h).par);
       h.par=sol;
       h.fit=fitness(h.par);
    end
end