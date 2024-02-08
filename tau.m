function answer = tau( sol , taski, taskt)
    newparameter;
    if sol (2, taski)== sol(2,taskt) && sol (3, taski)~= sol (3,taskt)
        answer =0;
    else
        answer =1;
    end
end
