function[encoded] = caesarShift(preEncoded, shiftNumber)
upPreEncoded = upper(preEncoded);
shiftNumber = rem(shiftNumber,26);
space = upPreEncoded == 32;
numPreEncoded = double(upPreEncoded);

even = mod(numPreEncoded,2) == 0;
odd = mod(numPreEncoded,2) == 1;
numPreEncoded(even) = numPreEncoded(even) + shiftNumber;
numPreEncoded(odd) = numPreEncoded(odd) - shiftNumber;

shiftUp = numPreEncoded < 65;
shiftDown = numPreEncoded > 90;
numPreEncoded(shiftUp) = numPreEncoded(shiftUp) + 26;
numPreEncoded(shiftDown) = numPreEncoded(shiftDown) - 26;

repJ = numPreEncoded == 74;
repU = numPreEncoded == 85;
numPreEncoded(repJ) = 73;
numPreEncoded(repU) = 86;
numPreEncoded(space) = 32;

vowel = numPreEncoded == 65 | numPreEncoded == 69 | numPreEncoded == 73 | numPreEncoded == 79 | numPreEncoded == 85 | numPreEncoded == 32;
consonant = ~vowel;

size = length(preEncoded(consonant));
size = num2str(size);
encoded = [numPreEncoded, size];
end