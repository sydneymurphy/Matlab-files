function[best] = pumpkinPatch(pumpkins)

[r,c] = size(pumpkins);
score = 0; 
for a = 1:r
    for b = 1:c
        points = 0;
        fns = fieldnames(pumpkins(a,b));
        [numfns,~] = size(fns);
        for y = 1:numfns
            category = fns{y};
            if ~ischar((pumpkins(a,b).(category)))
                points = points + pumpkins(a,b).(category); %Total up the points for each pumpkin
            end
        end
        if points > score
            score = points; %update highest score
            best = pumpkins(a,b); %update best which is pumpkin w/ highest score
        end
    end
end
for a = 1:r
    for b = 1:c
        fns = fieldnames(pumpkins(a,b));
        [numfns,~] = size(fns);
        for y = 1:numfns
            category = fns{y};
            if ischar((pumpkins(a,b).(category))) %check if any pumpkins say Great Pumpkin 
                if strcmp((pumpkins(a,b).(category)), 'Great Pumpkin')
                    best = pumpkins(a,b); %Great Pumpkin is best no matter which pumpkin has highest score
                end
            end
        end
    end
end
end