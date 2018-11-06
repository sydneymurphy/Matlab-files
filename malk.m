function[string] = malk(list, inventory)
[num,txt,raw] = xlsread(inventory);
fh = fopen(list);

line = fgetl(fh);
total = 0;
while ischar(line) 
    [item,quant] = strtok(line); %strtok to get the item and quantity of each item on list
    quant = str2num(quant);
    rowOfItem = find(strcmpi(txt,item)); %find the item in the inventory
    price = num(rowOfItem,3); %get price of item 
    total = total + (quant.*price); %add price to the total 
    line = fgetl(fh);
end
%Make a string describing the total, rounded to 2 decimal places. 
string = sprintf('My total will be $%0.2f.',total);

fclose(fh);
end