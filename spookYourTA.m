function[spooked] = spookYourTA(tas, stats)

fns = fieldnames(tas); %Gets out fieldnames 
[a,b] = size(stats); %Tells number of rows and columns of stats
inds = a.*b; %indices of the cell array stats
scores = []; 
people = {};
for y = 1:length(tas)
    score = 0;
    person = tas(y).Name; %Gets TA's name 
    for x = 1:2:inds 
        stat = stats{x}; %name of the statistic
        value = stats{x+1}; %value of factor for said statistic
        num = tas(y).(stat); %multiplies factor by TA's value for corresponding statistic
        score = score + num.*value; %TA's total score 
    end
    scores = [scores, score]; %vector of everyone's scores
    people = [people, {person}]; %vector of all TA's
end 
maxx = max(scores); %find highest score
ind = find(scores==maxx); %find index of highest score
spookedTA = people{ind}; %find TA at same index
%Write the output string about which TA to spook
spooked = sprintf('The highest score was %d points. SPOOK %s!!!', maxx, spookedTA); 
end