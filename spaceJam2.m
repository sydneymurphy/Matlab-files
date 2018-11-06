function[string] = spaceJam2(ageHeight, data)
%set max age and min height by accessing their values in the first input
maxAge = ageHeight(1,1);
minHeight = ageHeight(1,2);

%separate parts of data input & turn numeric parts of string into doubles
[name, rest] = strtok(data, ',');
rest(1) = [];
[age, rest] = (strtok(rest, ','));
age = str2num(age);
rest(1) = [];
[height, rest] = strtok(rest, ',');
[feet, rest1] = (strtok(height, '-'));
feet = str2num(feet);
rest1(1) = [];
inches = str2num(rest1);
height = 12.*feet+inches;
rest(1) = [];
[prevTeam, rest] = strtok(rest, ',');
rest(1) = [];
[sponsor, rest] = strtok(rest, ',');
rest(1) = [];
points = str2num(rest);

%Determine if person made team based on name, age, height, points, sponsor
if strcmp(name, 'Lola Bunny')
    string = sprintf('%s made the team!', name);
elseif strcmp(name, 'LeBron')
    string = sprintf('%s made the team!', name);
elseif age > maxAge
    string = sprintf('Sorry, %s doesn''t have what it takes to space jam.', name);
elseif height < minHeight
    string = sprintf('Sorry, %s doesn''t have what it takes to space jam.', name);
elseif points >= 15
    string = sprintf('%s made the team!', name);
elseif strcmp(sponsor, 'WB') || strcmp(sponsor, 'Warner Bros') || strcmp(sponsor, 'Warner Bros Pictures')
    string = sprintf('%s made the team!', name);
else
    string = sprintf('Sorry, %s doesn''t have what it takes to space jam.', name);
end
end