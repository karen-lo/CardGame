# /specs/card_spec_helper.rb
# Module of helper functions for Card specs

require_relative '../lib/commons'

module CardSpecHelper
  include Commons

  def CardSpecHelper.check_new_cards
    suit = 1
    value = 1
    DECK_SIZE.times do |i|
      new_card = Card.new(i)
      
      if new_card.suit != suit || new_card.value != value
        puts suit
        puts value
        print new_card.to_s
        return false
      end

      suit += 1
      if suit > SUITS.length
        suit = 1
        value += 1
      end
    end
    return true
  end
    
  def CardSpecHelper.check_to_string
    suit = 1
    value = 1
    
    DECK_SIZE.times do |i|
      new_card = Card.new(i)
      
      if "#{VALUES[value]} of #{SUITS[suit]}" != new_card.to_s
        puts "#{VALUES[value]} of #{SUITS[suit]} vs. #{new_card.to_s}"
        return false
      end
      
      suit += 1
      if suit > SUITS.length
        suit = 1
        value += 1
      end
    end
    return true
  end

end
