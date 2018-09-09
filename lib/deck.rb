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

  def serialize_deck
    i = 0
    string = ""

    @deck.each do |card|
      string << "[#{card.serialize_card}]"
      string << ", " if i < @num_cards-1
      i += 1
    end
    
    string << "\n"
  end

  def shuffle_deck
    @deck.shuffle!
  end

  def pass_out_hands(num_hands)
    if num_hands > 4
      raise 'Cannot pass out more than 4 hands.'
    elsif num_hands == 2
      num_hands = 3
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

  private

  def make_deck
    @num_cards.times do |i|
      @deck << Card.new(i)
    end
  end

end
