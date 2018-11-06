function[fave, sched] = favoriteBand(schedule, rainTime)

schedule(rainTime, :) = [];

[~, rowOfMax] = max(max(schedule'));
[~, colOfMax] = max(max(schedule));

fave = sprintf('My favorite band is act %d playing on Stage %d!', rowOfMax, colOfMax);
sched = schedule;

end