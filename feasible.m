function flag= feasible (sol)
    if feasibleCapacity (sol) && feasibleRam (sol) && feasibleDeadline (sol) && feasibleSecurity (sol)
        flag =1;
    else
        flag =0;
    end
end