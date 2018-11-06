function[newPizza, string] = boneless(pizza)
%Search for bones and count the number of bones 
bones = strcmpi(pizza, 'bones');
numbones = sum(sum(bones));

%Change every instance of bones to pineapple
pizza(strcmpi(pizza(:,:), 'bones')) = {'pineapple'};

newPizza = pizza;

%Create a string based on # of bones in pizza, with if statements. 
if numbones == 1
    string = sprintf('What a shame, I found a bone in my pizza.');
elseif numbones > 1
    string = sprintf('What a shame, I found %d bones in my pizza.', numbones);
elseif numbones == 0
    string = sprintf('I found no bones in my pizza!');
end

end