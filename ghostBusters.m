function[ghosts] = ghostBusters(unit)
ghosts = 0;
while isstruct(unit)
    if unit.ghost == true 
        ghosts = ghosts + 1; %if there's a ghost in that level, add to ghost count
        unit = unit.nextLevel; %set unit equal to the next level
        if isempty(unit)
            break
        end
    else
        unit = unit.nextLevel; %if there's no ghost, go to the next level
        if isempty(unit) %finished checking for ghosts when unit is []
            break
        end
    end
end  
end