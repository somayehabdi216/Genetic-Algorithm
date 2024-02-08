function bestIndividual = tournamentSelection(pop, k)
tournamentIndices = randperm(numel(pop), k);
    tournament = pop(tournamentIndices);
    [~, idx] = max([tournament.fit]); 
    bestIndividual = tournament(idx);
end
