function[reduced] = forgotMathHw(array)

%Get number of rows and columns in the input array. 
a = size(array,1);
b = size(array,2);

%Check for the first nonzero number in each row, divide rows to put 1's in
%the right places, divide appropriately to put 0's in the right places in
%the matrix. 
for r = 1:a
    for c = 1:b-1
        if array(r,c) ~= 0
            nonzero = array(r,c);
            break
        end
    end
    x = r;
    array(r,:) = (array(r,:))./nonzero;
    for r = r+1:a
        for c = 1:b-1
            if array(r,c) ~= 0
                nonzero = array(r,c);
            break
            end
        end 
        array(r,:) = array(r,:) - (array(x,:)).*nonzero;
    end
end

%After getting row echelon form, get reduced row echelon form by working
%from the bottom to get 0's in the right places. 
for r = a:-1:2
    x = r;
    for r = r-1:-1:1
        array(r,:) = array(r,:) - array(x,:).*array(r,x);
    end
end
reduced = round(array, 5);
end