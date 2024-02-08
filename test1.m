function crosspop = uniformcrossover (pop, npop,ncross)
         empty.par =[];
         empty.fit=inf;
         crosspop= repmat(empty, ncross,1);
        %offsprings= zeros(6,ntask);
        iter=0;
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

             Sol1=p1;
             Sol2=p2;
            
            for i=1:ntask
              if randi([0,1])           
               Sol1(2,i)= p2(2, i) ;
               Sol2(2,i)= p1(2, i) ;
               Sol1(3,i)= p2(3, i) ;
               Sol2(3,i)= p1(3, i) ;
               Sol1(4,i)= p2(4, i) ;
               Sol2(4,i)= p1(4, i) ;    
              else
               Sol1(2,i)= p1(2, i) ;
               Sol2(2,i)= p2(2, i) ;
               Sol1(3,i)= p1(3, i) ;
               Sol2(3,i)= p2(3, i) ;
               Sol1(4,i)= p1(4, i) ;
               Sol2(4,i)= p2(4, i) ;
             end
            end
            
          
IsCalculatedStartTime = zeros(1,ntask);
 for i=1: ntask
    Sol1(6,i)= runtime1(Sol1, i);    %**** Calculate run time
    %**** Calculate Start time
    pre= pred{i};
    s= length(pre);
    %****** Calculate Start time of predecessors of taski
    for j=1 : s
        if IsCalculatedStartTime(pre{j}) == 0
            Sol1(5,pre{j})= starttime1(Sol1,pre{j});
            IsCalculatedStartTime(1,pre{j})=1;
        end
    end
    %******* 
     Sol1(5,i)= starttime1(Sol1,i);
     IsCalculatedStartTime (1,i)=1;
     
 end
     if feasibleDeadline(Sol1)
           iter=iter+1;
           crosspop(iter).par=Sol1;
           crosspop(iter).fit=fitness1(Sol1);
           % h1.par=Sol1;
           % h1.fit = fitness1(Sol1);
       
                  
     end

     IsCalculatedStartTime = zeros(1,ntask);
    for i=1: ntask
    Sol2(6,i)= runtime1(Sol2, i);    %**** Calculate run time
    %**** Calculate Start time
    pre= pred{i};
    s= length(pre);
    %****** Calculate Start time of predecessors of taski
    for j=1 : s
        if IsCalculatedStartTime(pre{j}) == 0
            Sol2(5,pre{j})= starttime1(Sol2,pre{j});
            IsCalculatedStartTime(1,pre{j})=1;
        end
    end

    %******* 
     Sol2(5,i)= starttime1(Sol1,i);
     IsCalculatedStartTime (1,i)=1;
     
    end

    if feasibleDeadline(Sol2)
        iter=iter+1;
        crosspop(iter).par=Sol2;
        crosspop(iter).fit=fitness1(Sol2);
        %h2.par=Sol2;
       % h2.fit = fitness1(Sol2);
        %offsprings=[offsprings;h2];

                  
    end        
           % pop (h1).par=Sol1;
            %pop (h2).par=Sol2;
           % pop(h1).fit=  fitness(Sol1);
           % pop(h2).fit=  fitness(Sol2);
        end
end
