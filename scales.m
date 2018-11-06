function[notes,count] = scales(numbers, specificNote)

mask = numbers > 18;  %logical mask finding all numbers in number vector >  18

numbers(mask) = [];

reduced = mod(numbers,7);


reduced(reduced == 0) = 'C';
reduced(reduced == 1) = 'D';
reduced(reduced == 2) = 'E';
reduced(reduced == 3) = 'F';
reduced(reduced == 4) = 'G';
reduced(reduced == 5) = 'A';
reduced(reduced == 6) = 'B';

notes = char(reduced);
numrepeat = reduced == specificNote;
count = sum(numrepeat);

end