function[complete] = willage(incomplete)

complete = incomplete;

zero = find(incomplete == 0); %finds index of the 0

sumCols = sum(incomplete);  %gives sum of each column

sumIncomplete = sum(sumCols,2);  %gives sum of all elements of array

complete(zero) = 405 - sumIncomplete;  %creates mask over the 0 index
end