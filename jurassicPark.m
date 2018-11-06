function[winner] = jurassicPark(me, sibling)

if strcmp(me, 'T-rex')
    if strcmp(sibling, 'Velociraptor') || strcmp(sibling, 'Brachiosaurus')
        winner = sprintf('%s beats %s! Let''s go see the Utahraptors!', me, sibling);
    end
elseif strcmp(me, 'Velociraptor')
    if strcmp(sibling, 'Pterodactyl') || strcmp(sibling, 'Stegosaurus')
        winner = sprintf('%s beats %s! Let''s go see the Utahraptors!', me, sibling);
    end
elseif strcmp(me, 'Stegosaurus')
    if strcmp(sibling, 'T-rex') || strcmp(sibling, 'Pterodactyl')
        winner = sprintf('%s beats %s! Let''s go see the Utahraptors!', me, sibling);
    end
elseif strcmp(me, 'Pterodactyl')
    if strcmp(sibling, 'Brachiosaurus') || strcmp(sibling, 'T-rex')
        winner = sprintf('%s beats %s! Let''s go see the Utahraptors!', me, sibling);
    end
elseif strcmp(me, 'Brachiosaurus')
    if strcmp(sibling, 'Velociraptor') || strcmp(sibling, 'Stegosaurus')
        winner = sprintf('%s beats %s! Let''s go see the Utahraptors!', me, sibling);
    end
end
if strcmp(sibling, 'T-rex')
    if strcmp(me, 'Velociraptor') || strcmp(me, 'Brachiosaurus')
        winner = sprintf('%s loses to %s. I guess the Utahraptors will have to wait.', me, sibling);
    end
elseif strcmp(sibling, 'Velociraptor')
    if strcmp(me, 'Pterodactyl') || strcmp(me, 'Stegosaurus')
        winner = sprintf('%s loses to %s. I guess the Utahraptors will have to wait.', me, sibling);
    end
elseif strcmp(sibling, 'Stegosaurus')
    if strcmp(me, 'T-rex') || strcmp(me, 'Pterodactyl')
        winner = sprintf('%s loses to %s. I guess the Utahraptors will have to wait.', me, sibling);
    end
elseif strcmp(sibling, 'Pterodactyl')
    if strcmp(me, 'Brachiosaurus') || strcmp(me, 'T-rex')
        winner = sprintf('%s loses to %s. I guess the Utahraptors will have to wait.', me, sibling);
    end
elseif strcmp(sibling, 'Brachiosaurus')
    if strcmp(me, 'Velociraptor') || strcmp(me, 'Stegosaurus')
        winner = sprintf('%s loses to %s. I guess the Utahraptors will have to wait.', me, sibling);
    end
end
if strcmp(me, sibling)
    winner = 'It''s a tie!';
end
end