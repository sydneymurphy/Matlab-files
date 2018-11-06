function[sentence] = aceAttorney(filename)

fh = fopen(filename);
%Start score at 100
score = 100;
line = fgetl(fh);

%Get the speech title and author
[title, rest] = strtok(line, '-');
[author, ~] = strtok(rest, '-'); 

%Find every instance of uh, like, and THWG and add/subtract points
%according to the rules of the final score. 
line = fgetl(fh);
while ischar(line)
    if isempty(line)
        line = fgetl(fh);
    end
    line(line == ',') = '';
    line(line == '.') = '';
    line(line == '!') = '';
    line(line == '?') = '';
    line(line == ':') = '';
    line(line == ';') = '';
    line(line == '(') = '';
    line(line == ')') = '';
    [word, rest] = strtok(line);
    while ischar(word) && ~isempty(word)
        if strcmpi(word, 'uh')
            score = score - 3;
        elseif strcmpi(word, 'like')
            score = score - 1; 
        elseif strcmpi(word, 'THWG')
            score = score + 10;
        end
        [word, rest] = strtok(rest);
    end

    line = fgetl(fh);
end

%Make a sentence describing the outcome. 
sentence = sprintf('%s''s %s got a speech score of %d!', author, title, score);

fclose(fh);
end