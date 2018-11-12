# /specs/player_spec_helper.rb
# Module of helper functions for Player specs

require_relative 'spec_commons'

module PlayerSpecHelper
  include SpecCommons

  def PlayerSpecHelper.check_cards_not_in_hand(cards, hand)
    result = true
    cards.each do |card|
      result = false if hand.has_card?(card)
    end
    result
  end

  def PlayerSpecHelper.compare_cards(set1, set2)
    set2_orders = set2.map {|card| card.order}
    set1.each do |card|
      return false if !set2_orders.include?(card.order)
    end
    return true
  end

  def PlayerSpecHelper.parse_play_input(input)
    string = ""
    input.each_with_index do |card, i|
      val = card.value + VALUE_OFFSET
      val -= VALUES.length if val > VALUES.length
      string += "#{val}#{SUITS[card.suit][0, 1].downcase}"
      string += " " if i != input.length-1
    end
    string
  end

  def PlayerSpecHelper.select_cards_in_hand(num_cards, hand)
    cards = []
    loop do
      card = hand.cards.sample
      cards << card if !cards.include?(card)
      break if cards.length == num_cards
    end
    cards
  end

  def PlayerSpecHelper.select_cards_not_in_hand(num_cards, hand)
    cards = []
    loop do
      card = rand(DECK_SIZE)
      cards << card if !hand.has_card?(Card.new(card)) && !cards.include?(card)
      break if cards.length == num_cards
    end
    cards.map{|card| Card.new(card)}
  end

end
