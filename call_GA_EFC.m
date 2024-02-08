clc
clear 
close all
min_cost=1000;
max_cost=0;
mean_cost=0;
iter=10;
cost=0;
sum=0;
for i=1:iter
    cost=GA_EFC();
    sum=sum+cost;
    min_cost=min(min_cost,cost);
    max_cost=max(max_cost,cost);
end

mean_cost=sum/iter;

disp('best')
min_cost
disp('mean')
mean_cost
disp('worst')
max_cost