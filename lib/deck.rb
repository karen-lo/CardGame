# deck.rb
# Class definition for a Deck

require_relative 'card'

class Deck
  
  attr_accessor :num_cards
  
  def initialize(num_cards = 52)
    @num_cards = num_cards
    @deck = []
    make_deck
  end

  def print_deck
    @deck.each do |card|
      print "#{card.print_card}, "
    end
  end

  def make_deck
    @num_cards.times do |i|
      @deck << Card.new(i)
    end
  end

  def shuffle_deck
    @deck.shuffle
  end

  def pass_out_hands(num_hands)
    if num_hands > 4
      raise 'Cannot pass out more than 4 hands.'
    elsif num_hands < 2
      raise 'Cannot pass out less than 2 hands.'
    end
    
    hands = []
    num_hands.times do
      hands << []
    end
    
    i = 0
    @deck.each do |card|
      if i == num_hands
        i = 0
      end

      hands[i] << card
      i += 1
    end

    return hands
  end

end
