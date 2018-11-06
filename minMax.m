function[minn, maxx] = minMax(array)

%Get number of rows and number of columns. 
a = size(array,1);
b = size(array,2);

%Initialize and compare each index to the one before it for both min & max.
minn = array(1,1);
for r = 1:a
    for c = 1:b
        if array(r,c) < minn
            minn = array(r,c);
        else 
            minn = minn;
        end
    end
end

maxx = array(1,1);
for r = 1:a
    for c = 1:b
        if array(r,c) > maxx
            maxx = array(r,c);
        else
            maxx = maxx;
        end
    end
end
end