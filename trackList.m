function[wrong, positions] = trackList(songs, belong)

positions = strfind(belong == true, 1);

%creates the indices for the start of each word
vecOfFives = 0:5:(length(belong)-1).*5;
vecOfLength = 1:length(belong);
startOfWords = vecOfFives + vecOfLength;

%gives the indices of the start of each WANTED word
wordsWanted = startOfWords(~belong);

letterOne = songs(wordsWanted);
letterTwo = songs(wordsWanted + 1);
letterThree = songs(wordsWanted + 2);
letterFour = songs(wordsWanted + 3);
letterFive = songs(wordsWanted + 4);

wrong = 1:length(wordsWanted)*6;
wrong(1:6:end) = letterOne;
wrong(2:6:end) = letterTwo;
wrong(3:6:end) = letterThree;
wrong(4:6:end) = letterFour;
wrong(5:6:end) = letterFive;
wrong(6:6:end) = ' ';
wrong = char(wrong);
end