function[cavities, strength] = shinyTeeth(teeth)
strength = 0;
cavities = [];
ind = 1;
for x = teeth  %make a for loop for while iscell in order to remove the layers of the cell
    while iscell(x)
        x = x{1};
    end
    if x == 0  
        cavities = [cavities, ind];
        ind = ind+1;
    else
        strength = strength + x;
        ind = ind+1;
    end
end
end