function[newPizza1,newPizza2] = arRaysPizza(pizza1, pizza2, topping)

newPizza1 = pizza1;

newPizza2 = pizza2;

toppingLoc = find(pizza1 == topping); %finds indices of topping in 1st pizza

za2toppings = pizza2(toppingLoc); %finds values of same indices in 2nd pizza. 

newPizza1(toppingLoc) = za2toppings;  %put za2toppings into newPizza1

newPizza2(toppingLoc) = topping;  %puts toppings in same indices of 2nd pizza.

%Cut off the crust
newPizza2(1,:) = [];
newPizza2(:,1) = [];
newPizza2(end,:) = [];
newPizza2(:,end) = [];
end