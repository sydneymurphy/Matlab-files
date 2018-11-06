function[game] = oceans11(me, dealer)

%Change J, Q, and K to value 10
me = strrep(me, 'J', '10');
me = strrep(me, 'Q', '10');
me = strrep(me, 'K', '10');
dealer = strrep(dealer, 'J', '10');
dealer = strrep(dealer, 'Q', '10');
dealer = strrep(dealer, 'K', '10');

%Find Aces & change them to value 11 / 1 depending on the other card values
aceMe = strfind(me, 'A');
aceDealer = strfind(dealer, 'A');
restMe = me;
restMe(aceMe) = [];
restDealer = dealer;
restDealer(aceDealer) = [];
restMe = str2num(restMe);
restDealer = str2num(restDealer);

if sum(restMe) <= 10
    me = strrep(me, 'A', '11');
elseif sum(restMe) > 10
    me = strrep(me, 'A', '1');
end
if sum(restDealer) <= 10
    dealer = strrep(dealer, 'A', '11');
elseif sum(restDealer) > 10
    dealer = strrep(dealer, 'A', '1');
end

%Change strings to number values and sum them to get total points
me = str2num(me);
dealer = str2num(dealer);

myPoints = sum(me);
dealerPoints = sum(dealer);

%if statements to determine first and second sentences
if myPoints > 21
    out1 = 'I busted.';
elseif myPoints == 21
    out1 = 'I got a Blackjack!';
elseif myPoints < 21
    out1 = sprintf('I got a score of %d.', myPoints);
end
if dealerPoints > 21
    out2 = 'The Dealer busted.';
elseif dealerPoints == 21
    out2 = 'The Dealer got a Blackjack!';
elseif dealerPoints < 21
    out2 = sprintf('The Dealer got a score of %d.', dealerPoints);
end

%if statements to determine third sentence
if strcmp(out1, 'I busted.') && strcmp(out2, 'The Dealer busted.')
    out3 = 'We both busted.';
end
if strcmp(out1, 'I busted.') && ~strcmp(out2, 'The Dealer busted.')
    out3 = 'The Dealer wins!';
end
if ~strcmp(out1, 'I busted.') && strcmp(out2, 'The Dealer busted.')
    out3 = 'I win!';
end
if strcmp(out1, 'I got a Blackjack!') && strcmp(out2, 'The Dealer got a Blackjack!')
    out3 = 'The Dealer wins!';
end
if strcmp(out1, 'I got a Blackjack!') && ~strcmp(out2, 'The Dealer got a Blackjack!')
    out3 = 'I win!';
end
if ~strcmp(out1, 'I got a Blackjack!') && strcmp(out2, 'The Dealer got a Blackjack!')
    out3 = 'The Dealer wins!';
end
if ~strcmp(out1, 'I busted.') && ~strcmp(out2, 'The Dealer busted.') && ~strcmp(out1, 'I got a Blackjack!') && ~strcmp(out2, 'The Dealer got a Blackjack!')
    if myPoints > dealerPoints
        out3 = 'I win!';
    elseif myPoints <= dealerPoints
        out3 = 'The Dealer wins!';
    end
end

%Concatenate sentences to get final output
game = [out1, ' ', out2, ' ', out3];
end