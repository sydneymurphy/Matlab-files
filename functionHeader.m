function [fh] = functionHeader(funcName, inputs, outputs)

fh = fopen(sprintf('%s.txt', funcName), 'w');

%Make outs vector with an if statement and for loop 
outs = '';
if outputs ~= 0
    for x = 1:outputs
        outs = [outs, sprintf('out%d', x), ' '];
    end
    outs(end) = '';
else
    outs = '';
end

%Make inputs vector with for loop
ins = '';
for y = 1:inputs
    ins = [ins, sprintf('in%d,', y), ' '];
end
ins(end-1:end) = '';

%Use fprintf to print everything into the text file
fprintf(fh, 'function [%s] = %s(%s)\n\nend', outs, funcName, ins);
fclose(fh);
end
