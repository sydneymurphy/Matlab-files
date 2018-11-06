function[string, losers] = costumeContest(st, banned)

numContestants = length(st);
yeses = [];
for x = 1:numContestants %Make vector of all contestants w/ banned component
    val = st(x).(banned);
    if strcmp(val, 'Yes')
        yeses = [yeses, x]; 
    end
end
st(yeses) = []; %Delete contestants w/ banned component
st = rmfield(st, (banned)); %Removed banned field from entire structure array 
numContestants = length(st); %Update number of contestants remaining

%Check for fields Cardboard and Makeup
cardboard = isfield(st, 'Cardboard');
makeup = isfield(st, 'Makeup');

if cardboard == true && makeup == true %If both fields exist, see which contestants use both
    for x = 1:numContestants
        if strcmp(st(x).Cardboard, 'Yes') && strcmp(st(x).Makeup, 'Yes')
            st(x).Originality = st(x).Originality + 8; %plus 8 if uses both 
        elseif strcmp(st(x).Cardboard, 'Yes')
            st(x).Originality = st(x).Originality + 3; %plus 3 if uses cardboard
        elseif strcmp(st(x).Makeup, 'Yes')
            st(x).Originality = st(x).Originality + 3; %plus 3 if uses makeup
        end
    end
elseif cardboard == true %if cardboard field exists, see which contestants use it
    for x = 1:numContestants
        if strcmp(st(x).Cardboard, 'Yes')
            st(x).Originality = st(x).Originality + 3; %plus 3 if yes
        end
    end
elseif makeup == true %if makeup field exists, see which contestants use it
    for x = 1:numContestants
        if strcmp(st(x).Makeup, 'Yes')
            st(x).Originality = st(x).Originality + 3; %plus 3 if yes
        end
    end
end

originalities = [];
for x = 1:numContestants %Make vector of all contestants' originality scores
    originalities = [originalities, st(x).Originality];
end

[~,inds] = sort(originalities, 'descend'); %sorts originality scores

st = st(inds); %sorts structure array based on sorted originality scores
st = rmfield(st, 'Originality'); %removes originality field from entire structure array 

%winner is first contestant in sorted structure array; runner-up is second
winner = st(1).Contestants; 
runnerUp = st(2).Contestants;

%Write string for winner and runnerup 
string = sprintf('%s is the winner of the costume contest! and %s is the first loser, I mean second place winner of the costume contest!', winner, runnerUp);

%output structure array of the losers (every structure but the 1st one)
losers = st(2:end);

end