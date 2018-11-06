function[player] = fantasySelect(file)
[num,txt,raw] = xlsread(file);
goalsCol = find(strcmp(raw(1,:), 'Goals'));
assistsCol = find(strcmp(raw(1,:), 'Assists'));
gamesCol = find(strcmp(raw(1,:), 'Games'));
[r,~] = size(raw(2:end));
count = 0;
for a = 2:r
    ppg = (raw{a,goalsCol} + raw{a, assistsCol})./raw{a,gamesCol};
    if ppg > count
        player = raw{a,1};
        count = ppg;
    end
end