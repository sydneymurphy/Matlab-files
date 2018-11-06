function[newca] = cowcium(datafile, header)

[num,txt,raw] = xlsread(datafile);
headers = txt(1,:);
 
wordColumns = [];
inds = [];
rawCols = size(raw,2);
for a = 1:rawCols
    if ischar(raw{2,a}) == true
        inds = [inds, a];
        wordColumns = [wordColumns, raw(2:end,a)];
    end
end

colCalcium = find(strcmp(raw(1,:), 'Calcium')); %finds the Calcium column

colCalcium = cell2mat(raw(2:end,colCalcium));

delete = find(colCalcium < 20); %finds the row(s) where calcium is less than 20

num(delete,:) = []; %deletes the row(s) where calcium is less than 20

if ~isempty(wordColumns)
    wordColumns(delete,:) = [];
end

colHeader = find(strcmp(raw(1,:), header)); %finds which column the header is in

dubraw = cell2mat(raw(2:end,colHeader));

dubraw(delete,:) = [];

[sorted,rows] = sort(dubraw,'descend'); %sorts the header column & gets indices

num(:,:) = num(rows,:); %sorts entire num array in same order as sorted header column

if ~isempty(wordColumns)
    wordColumns(:,:) = wordColumns(rows,:);
end

num = num2cell(num);

ind = 0;
for x = inds
    if x == 1
        num = [wordColumns(:,1),num];
        ind = ind+1;
    elseif x > 1 && x < rawCols
        num(:,x) = wordColumns(:,ind+1);
        ind = ind+1;
    elseif x == rawCols
        num = [num,wordColumns(:,end)];
    end
end
    
newca = [headers;num];

end