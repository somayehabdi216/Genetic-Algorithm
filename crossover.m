function pop = crossover (pop, npop,ncross)
        newparameter;
        for i=1:ncross
          %  h1= randi( npop);
          %  h2= randi (h1);
          %  p1= pop(h1).par;
          %  p2= pop(h2).par;

             h1=tournamentSelection(pop, 5); 
             h2=  tournamentSelection(pop, 5); 
             p1=h1.par;
             p2=h2.par;
          
            j= randi([1 ntask]);
            Sol1=p1;
            Sol2=p2;
            
            Sol1(2,:)= [p1(2,1:j) p2(2,j+1 :end)];
            Sol2(2,:)= [p2(2, 1:j) p1(2, j+1:end) ];
            Sol1(3,:)= [p1(3,1:j) p2(3,j+1 :end)];
            Sol2(3,:)= [p2(3, 1:j) p1(3, j+1:end) ];
            Sol1(4,:)= [p1(4,1:j) p2(4,j+1 :end)];
            Sol2(4,:)= [p2(4, 1:j) p1(4, j+1:end) ];
           
             h1.par=Sol1;
             h2.par=Sol2;
             h1.fit=fitness(Sol1);
             h2.fit=fitness(Sol2);

%             pop (h1).par=Sol1;
%             pop (h2).par=Sol2;
%             pop(h1).fit=  fitness(Sol1);
%             pop(h2).fit=  fitness(Sol2);
        end
end