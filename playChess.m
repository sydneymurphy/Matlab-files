function[board] = playChess(input)

%Create 8 by 8 board and make each index equal to the value of a space. 
board(8,8) = ' ';
board(:,:) = char(32); 

%Find number of rows in input. 
a = size(input,1);

%Go through input array and see what letter is in the second column. 
for r = 1:a
    for c = 2
        if input(r,c) == 'A'
            col = 1;
        elseif input(r,c) == 'B'
            col = 2;
        elseif input(r,c) == 'C'
            col = 3;
        elseif input(r,c) == 'D'
            col = 4;
        elseif input(r,c) == 'E'
            col = 5;
        elseif input(r,c) == 'F'
            col = 6;
        elseif input(r,c) == 'G'
            col = 7;
        elseif input(r,c) == 'H'
            col = 8;
        end
    end
    %Go through input array and see what number is in third column. 
    for c = 3
        if input(r,c) == '8'
            row = 1;
        elseif input(r,c) == '7'
            row = 2;
        elseif input(r,c) == '6'
            row = 3;
        elseif input(r,c) == '5'
            row = 4;
        elseif input(r,c) == '4'
            row = 5;
        elseif input(r,c) == '3'
            row = 6;
        elseif input(r,c) == '2'
            row = 7;
        elseif input(r,c) == '1'
            row = 8;
        end
    end
    %Set the spaces on the 8 by 8 board equal to the corresponding input
    %letters. 
    board(row,col) = input(r,1); 
end
board = char(board);
end