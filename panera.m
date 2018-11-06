function[remainding] = panera(orders, name)

columns = size(orders,2);

transOrders = orders';

linOrders = transOrders(1:end);

findName = strfind(linOrders, name);

wholeName = linOrders(findName:findName+(columns-1));

beforeName = linOrders(1:findName-1);

lengthB4name = length(beforeName);

remainding = lengthB4name/columns;
end