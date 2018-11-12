# /lib/hand.rb
# Class definition for a Hand

require_relative 'card'
require_relative 'commons'

class Hand
  
  attr_accessor :cards, :num_cards, :smallest_card

  def initialize(cards)
    @cards = cards
    @num_cards = cards.length
    find_smallest_card
  end

  def has_card?(card)
    @cards.each do |hand_card|
      return true if card.order == hand_card.order
    end
    return false
  end

  def remove_cards(card_arr)
    del_arr = []
    card_arr_order = card_arr.map{|card| card.order}
    @cards.delete_if{|card| card_arr_order.include?(card.order)}
  end

  def to_s
    string = "{ "
    @cards.each_with_index do |card, i|
      string << "[#{card.to_s}]"
      string << ", " if i < @num_cards-1
    end
    string << " }\n"
  end

  private

  def find_smallest_card
    @smallest_card = @cards[0]
    @cards.each do |card|
      next if card.order > @smallest_card.order
      @smallest_card = card
    end
  end
  
end
