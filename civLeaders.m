function [fhFinal] = civLeaders(file)

fh = fopen(file);
fhNew = fopen([file(1:end-4),'_leadersnew.txt'], 'w');
num = 0;
line = fgetl(fh); %first line of leader list
while ischar(line)
    [civfile, rest] = strtok(line, ':');
    fhciv = fopen(civfile); %opens the description file 
    lineciv = fgetl(fhciv); %first line of description file
    leader = [strtok(rest, ':'), ':']; %leader to search for w/ :
    while ischar(lineciv)
        if strcmp(lineciv,leader)
            fprintf(fhNew, [lineciv, '\n']); %prints leader into new file
            lineciv = fgetl(fhciv);
            num = num+1;
            break
        else
            lineciv = fgetl(fhciv);
        end
    end
    while ischar(lineciv)
        if all(lineciv ~= ':') == true
            fprintf(fhNew, [lineciv, '\n']); %prints paragraph for leader
            num = num + 1;  
        else
            break
        end
        lineciv = fgetl(fhciv);
    end
    line = fgetl(fh);
end

%%Delete empty line
fhFinal = fopen([file(1:end-4),'_leaders.txt'], 'w'); 
fclose(fhNew);
fhNew = fopen([file(1:end-4),'_leadersnew.txt']);
for x = 1:num-1
    line = fgetl(fhNew);
    fprintf(fhFinal, [line, '\n']);
end
line = fgets(fhNew);
print = line(1:end-1);
fprintf(fhFinal, print);


fclose(fh);
fclose(fhciv);
fclose(fhNew);
fclose(fhFinal);
end