# /specs/hand_spec_helper.rb
# Module of helper functions for Hand specs

require_relative 'spec_commons'

module HandSpecHelper
  include SpecCommons

  def HandSpecHelper.card_not_in_hand(cards_arr)
    cards_order = cards_arr.map{|card| card.order}
    card = nil
    loop do
      card = rand(DECK_SIZE) 
      break if !cards_order.include? card
    end
    Card.new(card)
  end

  def HandSpecHelper.check_cards_not_in_hand(cards, hand)
    result = true
    cards.each do |card|
      result = false if hand.has_card?(card)
    end
    result
  end

  def HandSpecHelper.check_smallest_card(hand)
    cards = []
    hand.cards.each do |card|
      cards << card.order
    end
    cards.sort[0] == hand.smallest_card.order
  end

  def HandSpecHelper.check_to_string(hand_str, cards_arr)
    cards_arr.each do |card|
      return false if !hand_str.include? "[#{card.to_s}]"
    end
    return true
  end

end
