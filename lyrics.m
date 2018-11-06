function[opinion] = lyrics(song, words)
[songName,~] = strtok(song, ',');

empty1 = isempty(strfind(words, 'MATLAB')); %full is 0
empty2 = isempty(strfind(words, '1371')); %full is 0

taylor = isempty(strfind(song, 'Taylor Swift'));%present is 0
kanye = isempty(strfind(song, 'Kanye West'));%present is 0

gold = isempty(strfind(lower(words), 'gold'));%present is 0
red = isempty(strfind(lower(words), 'red')); %not present is 1

points = [20, 10, -5, 15];

logicals = [(~empty1||~empty2), ~taylor, ~kanye, (~gold&&red)];

finalScore = sum(points(logicals));

opinion = sprintf('%s received a score of %d points.', songName, finalScore);

end