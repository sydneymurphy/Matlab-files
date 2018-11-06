function[string] = evilIsAfoot(file, sequence)
fh = fopen(file);

string = '';

line = fgetl(fh);

while ~isempty(line)
    string(1) = line(1); 
    break
end

num = 1;
col = 1;
for ind = 1:length(sequence)
    if sequence(ind) == 'j'
        line = fgetl(fh);
        string(ind+1) = line(col);
        num = num+1;
    elseif sequence(ind) == 'l'
        string(ind+1) = line(col+1);
        col = col+1;
    elseif sequence(ind) == 'h'
        string(ind+1) = line(col-1);
        col = col-1;
    elseif sequence(ind) == 'k'
        num = num-1;
        fclose(fh);
        fh = fopen(file);
        for x = 1:num
            line = fgetl(fh);
        end
        string(ind+1) = line(col);
    end
    
end
fclose(fh);
end