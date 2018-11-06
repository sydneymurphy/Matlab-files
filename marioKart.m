function [fhWinner] = marioKart(filename)

fh = fopen(filename);
fhWinner = fopen([sprintf('%s',filename(1:end-4)), '_winner.txt'], 'w');

line = fgetl(fh);

%Get player's name, data (how many times they got in 1st, 2nd, or 3rd,
%place)
score = 0;
while ischar(line)
    [name,rest] = strtok(line);
    [data1,rest] = strtok(rest);
    [place1,num] = strtok(data1, ':');
    count1 = str2num(strtok(num, ':'));
    
    [data2,rest] = strtok(rest);
    [place2,num] = strtok(data2, ':');
    count2 = str2num(strtok(num, ':')); 
    
    [data3,rest] = strtok(rest);
    [place3,num] = strtok(data3, ':');
    count3 = str2num(strtok(num, ':'));
    %Make if statements for when the player got in 1st, 2nd, 3rd, and add
    %points to the score based on that. 
    if strcmp(place1, '1st')
        count1 = count1.*15;
    elseif strcmp(place1, '2nd')
        count1 = count1.*12;
    elseif strcmp(place1, '3rd')
        count1 = count1.*10;
    end
    
    if strcmp(place2, '1st')
        count2 = count2.*15;
    elseif strcmp(place2, '2nd')
        count2 = count2.*12;
    elseif strcmp(place2, '3rd')
        count2 = count2.*10;
    end
    
    if strcmp(place3, '1st')
        count3 = count3.*15;
    elseif strcmp(place3, '2nd')
        count3 = count3.*12;
    elseif strcmp(place3, '3rd')
        count3 = count3.*10;
    end
    %Keep score the same unless the next player's score is higher, then set
    %score to that player's score. Set winner equal to the name of winning
    %player. 
    if count1+count2+count3 > score
        score = count1+count2+count3;
        winner = strtok(name,':');
    else
        score = score;
        winner = winner;
    end
    
    line = fgetl(fh);
end
%In the text file, print the winner and how many points they got with
%variables winner and score. 
fprintf(fhWinner, 'Winner: %s\nPoints: %d', winner, score);
fclose(fh);
fclose(fhWinner);

end