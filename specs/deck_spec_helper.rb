module DeckSpecHelper

  THREE_OF_DIAMONDS = 2

  def DeckSpecHelper.check_new_hand_sizes(num_hands, hands, num_cards)
    i = 0
    hands.each do |hand|
      puts "hand #{i}"
      j = 0
   
      hand.each do |card|
        print "#{j}, "
        j += 1
      end

      i += 1
      puts

      if num_hands == 4 && j != num_cards/num_hands
        return false
      elsif num_hands < 4 && 
            j != num_cards/num_hands && j != (num_cards/num_hands)+1
	return false
      end
    end
    return true
  end

  def DeckSpecHelper.check_extra_card_placement(hands, big_hand_size)
    i = 0
    long_deck = 0
    three_dia = 0
    
    puts "number of hands: #{hands.length}"

    hands.each do |hand|
      i += 1
      puts DeckSpecHelper.print_cards(hand)
      
      if hand.length == big_hand_size
	long_deck = i
      end
     
      hand.each do |card|
        if card.serialize_card.eql?(Card.new(THREE_OF_DIAMONDS).serialize_card)
	  three_dia = i
        end
      end
    end
    puts "long deck: #{long_deck}, three of diamonds: #{three_dia}"
    return true if long_deck == three_dia
    return false
  end

  def DeckSpecHelper.print_cards(cards_arr)
    string = "{ "
    i = 0

    cards_arr.each do |card|
      string << "[#{card.serialize_card}]"
      string << ", " if i < cards_arr.length-1
      i += 1
    end
    
    string << " }\n"
  end
end
