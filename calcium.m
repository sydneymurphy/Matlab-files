function[atoms] = calcium(file)
fh = fopen(file);
line = fgetl(fh); 
ind = 1;
atom = '';
atomstr = '';
while ischar(line)   
    for let = line
        if let >= 65 && let <= 90
            atom = let;
            ind = ind+1;
            if ind <= length(line) && line(ind) >= 97 && line(ind) <= 122
                atom = [atom,line(ind)];
            end
            atomstr = [atomstr,atom];
        else 
            ind = ind+1;
        end
    end
    line = fgetl(fh);
    ind = 1;
end

firstRow = {};
ind = 1;
for x = atomstr
    if x >= 65 && x <= 90
        atom = x;
        ind = ind+1;
        if ind <= length(atomstr) && atomstr(ind) >= 97 && atomstr(ind) <= 122
            atom = [atom,atomstr(ind)];
        end
        if any(strcmp(firstRow,atom))
            firstRow = firstRow;
        else
            firstRow = [firstRow,atom];
        end
    else
        ind = ind+1;
    end
end

fclose(fh);
fh = fopen(file);
line = fgetl(fh);
ind = 1;
count = 0;
secondRow = {};
for a = 1:length(firstRow)
    atomSearch = firstRow{a};
    while ischar(line)
        for let = line
            if length(atomSearch) == 2
                if ind+1 <= length(line)
                    let = [let,line(ind+1)];
                end
                if strcmp(let,atomSearch)
                    ind = ind+2;
                    if ind <= length(line) && line(ind) >= 48 && line(ind) <= 57
                        number = line(ind);
                        if ind+1 <= length(line)
                            for yeet = ind+1:length(line)
                                if yeet <= length(line) && line(yeet) >= 48 && line(yeet) <= 57
                                    number = [number, line(ind+1)];
                                else
                                    break
                                end
                            end
                        end
                        number = str2num(number);
                        count = count + number;
                    elseif ind <= length(line) && line(ind) >= 65 && line(ind) <= 90
                        count = count + 1;
                    elseif ind > length(line)
                        count = count + 1;
                    end
                    ind = ind-1;
                else
                    ind = ind+1;
                end
            
            else
                if strcmp(let,atomSearch)
                    ind = ind+1;
                    if ind <= length(line) && line(ind) >= 48 && line(ind) <= 57
                        number = line(ind);
                        if ind+1 <= length(line)
                            for yeet = ind+1:length(line)
                                if yeet <= length(line) && line(yeet) >= 48 && line(yeet) <= 57
                                    number = [number, line(ind+1)];
                                else
                                    break
                                end
                            end
                        end
                        number = str2num(number);
                        count = count + number;
                    elseif ind <= length(line) && line(ind) >= 97 && line(ind) <= 122
                        count = count;
                    elseif ind <= length(line) && line(ind) >= 65 && line(ind) <= 90 
                        count = count + 1;
                    elseif ind > length(line)
                        count = count + 1;
                    end
                else
                    ind = ind+1;
                end
            end
        end
        line = fgetl(fh);
        ind = 1;
    end
    secondRow = [secondRow, count];
    fclose(fh);
    fh = fopen(file);
    line = fgetl(fh);
    ind = 1;
    count = 0;
end

[firstRow, inds] = sort(firstRow);
secondRow = secondRow(inds);
atoms = [firstRow;secondRow];

fclose(fh);
end