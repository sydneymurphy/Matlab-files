function[string] = fluxCapacitor(year, destination, speed)

if speed >= 88
    if destination > year
        string = sprintf('We''re going to the year %d, to the future!!!', destination);
    elseif destination < year
        string = sprintf('We''re going to the year %d, back in time!!!', destination);
    end
elseif speed < 88
    string = 'Time traveling is just too dangerous. Better that I devote myself to study the other great mystery of the universe: MATLAB!';
end
end