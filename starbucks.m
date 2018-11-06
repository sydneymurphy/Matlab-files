function[newMenu] = starbucks(menu, secret)
maxVenti = max(menu(:, end));

fat = find(menu(:,end)==maxVenti);

menu(fat,:) = [];

newMenu = [menu;secret];

newMenu(:,1:2) = [];

newMenu(:,end-1:end) = [];

ratio = (newMenu(:,1))./(newMenu(:,end));

[sortRatio,inds] = sort(ratio, 'ascend');

newMenu(:,1) = newMenu(inds);

numRows = size(newMenu,1);

newMenu(:,end) = newMenu(inds+numRows);
end