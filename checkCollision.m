% checkCollision determines if the next move in the classic game of snake
% will cause a collision
%
%   [out, next] = checkCollision(board, head, move)
%   
%   Inputs:   board - the current game board
%             head - the 1x2 vector containing the [row col] indicies for 
%                    the head of the snake
%             move - the direction the snake will try and move
%
%   OutPuts:  out - a string that describes the outcome of the next move:
%                   'continue' means the snake will move forward as normal
%                   'cookie' means the snake will increase its length by 1
%                   'Game Over' means the next move will end the game
%             next - a 1x2 vector containing the [row col] indicies for
%                    where the head of the snake will be after on the next
%                    move. If the game will end, next will have value of
%                    [0, 0].


function [out, next] = checkCollision(board, head, move)

move = upper(move); %in case input it lower case
[rMax, cMax] = size(board);
% [headR, headC] = find(board == max(max(board))); % finds head of snake
% head = [headR, headC];
headR = head(1);
headC = head(2);
% does different code blocks based on direction
switch move
    case 'N'
        % hits a wall
        if headR - 1 == 0
            out = 'Game Over';
        else        
            new = board(headR - 1, headC);
            next = [headR-1 headC];
            % new head location
            out = newHead(new);
        end
        %       
    case 'S'
        % hits a wall
        if headR == rMax
            out = 'Game Over';
        else        
            new = board(headR + 1, headC);
            next = [headR + 1, headC];
            % new head location
            out = newHead(new);
        end
        %
    case 'E'
        % hits a wall
        if headC == cMax
            out = 'Game Over';
        else        
            new = board(headR, headC + 1);
            next = [headR, headC + 1];
            % new head location
            out = newHead(new);
        end
        %
    case 'W'
        % hits a wall
        if headC - 1 == 0
            out = 'Game Over';
        else        
            new = board(headR, headC - 1);
            next = [headR, headC - 1];
            % new head location
            out = newHead(new);
        end
        %
       
end
if strcmp(out, 'Game Over')
    next = [0,0]; % gives nHead a value if Game Over!
end
% end of function
end

function out = newHead(new)
% moves the head       
    if new == 0 || new == 1
        out = 'continue';
    elseif new == -1
        out = 'cookie';
    else
        out = 'Game Over';
    end
end