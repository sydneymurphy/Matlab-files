function[string]= sandlot(distance, angle, pitch)

switch pitch
    case {'slider', 'knuckleball'}
        string = 'Strike!';
    otherwise
        if angle > 90 || angle < 0
            string = 'Foul ball.';
        else
            if angle >= 0 && angle <= 30
                if distance >= 106
                    string = 'Home run!';
                else
                    string = sprintf('You hit the ball %d yards into left field.', distance);
                end
            elseif angle > 30 && angle < 60
                if distance >= 136
                    string = 'Home run!';
                else 
                    string = sprintf('You hit the ball %d yards into center field.', distance);
                end
            elseif angle >= 60 && angle <= 90
                if distance >= 104
                    string = 'Home run!';
                else
                    string = sprintf('You hit the ball %d yards into right field.', distance);
                end
            end
        end
end
end