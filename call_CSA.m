clc
clear 
close all
min_cost=1000;
mean_cost=0;
iter=10;
cost=0;
count=0;
sum=0;
for i=1:iter
    cost=CSA();
%     if cost~=Inf
%         count=count+1;
        sum=sum+cost;
        min_cost=min(min_cost,cost);
%     end
end

mean_cost=sum/iter;

disp('best')
min_cost
disp('mean')
mean_cost
