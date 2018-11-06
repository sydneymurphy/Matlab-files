function [primes] = primeTime(cap)

%Initialize by creating vector starting at the first prime number, 2, &
%also create output starting at 2. 
vec = 2:cap;
primes = 2;

%When setting n equal to vec, it will check 2 first, so have output stay as
%is. Then go to next index and test if each index is divisible by anything
%other than itself and 1. Delete if yes. If not, put in output. 
for n = vec
    if n == 2
        primes = primes;
    else
        for m = 2:n-1
            if mod(n,m) == 0
                vec(vec==n) = [];
                break
            end
            if mod(n,m) ~= 0
                yesprime = true;
            end
        end
    end
end

    if yesprime == true
        primes = vec;
    end
end