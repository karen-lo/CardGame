# /specs/card_spec_helper.rb
# Module of helper functions for Card specs

module CardSpecHelper
  DECK_SIZE = 52

  def CardSpecHelper.check_new_cards(val_len)
    suit = 1
    value = 1
    DECK_SIZE.times do |i|
      new_card = Card.new(i)
      
      if new_card.suit != suit || new_card.value != value
	return false
      end

      value += 1
      if value > val_len
        value = 1
	suit += 1
      end
    end
    return true
  end
    
  def CardSpecHelper.check_to_string(suits, values)
    suit = 1
    value = 1
    
    DECK_SIZE.times do |i|
      new_card = Card.new(i)
      
      if "#{values[value]} of #{suits[suit]}" != new_card.to_s
        puts "#{values[value]} of #{suits[suit]} vs. #{new_card.to_s}"
	return false
      end
      
      value += 1
      if value > values.length
        value = 1
	suit += 1
      end
    end
    return true
  end

end
