function[outArray] = ripTacoBell(inArray)

outArray = inArray;

mask8 = mod(outArray,8) == 0 & mod(outArray,7) ~= 0;

mask9 = mod(outArray,9) == 0 & mod(outArray,7) ~= 0;

outArray(mask8) = 7;

outArray(mask9) = 7;
end