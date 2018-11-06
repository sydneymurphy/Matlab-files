function[game] = blackJack(myHand, dealerHand, deck)

%Get sum of each player's hand.
mySum = sum(myHand);
dealerSum = sum(dealerHand);

%When my score is 11 or less, take a card & delete one from deck. 
while mySum <= 11
    myHand = [myHand, deck(1)];
    deck(1) = [];
    mySum = sum(myHand);
end

%When my score is between 12 and 16 inclusive, & dealer's score is btwn 2
%and 6 inclusive, I stand. Otherwise, I take card and delete one from deck.
while mySum >= 12 && mySum <= 16
    if dealerHand(1) >= 2 && dealerHand(1) <= 6
        myHand = myHand;
        break
    else
        myHand = [myHand, deck(1)];
        deck(1) = [];
        mySum = sum(myHand);
    end
end

%If my score is 17 or more, I stand. 
while mySum >= 17
    myHand = myHand;
    break
end

%If dealer's score is less than 17, dealer takes card, delete card from deck.
while dealerSum < 17
    dealerHand = [dealerHand, deck(1)];
    deck(1) = [];
    dealerSum = sum(dealerHand);
end

%If dealer's score is 17 or higher, dealer stands. 
while dealerSum >= 17
    dealerSum = dealerSum;
    break
end

%Both above 21 is a bust; one above 21, other wins. Compare scores if no
%one busts. 
if mySum > 21 
    if dealerSum > 21
        game = 'We both busted.';
    else 
        game = 'The dealer wins.'; 
    end
else
    if dealerSum > 21
        game = 'I win!';
    else 
        if mySum > dealerSum
            game = 'I win!';
        elseif dealerSum > mySum
            game = 'The dealer wins.';
        elseif mySum == dealerSum
            game = 'The dealer wins.';
        end
    end
end
end
