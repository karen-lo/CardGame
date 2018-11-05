# /specs/player_spec_helper.rb
# Module of helper functions for Player specs

require_relative '../lib/game_text'
require_relative 'spec_commons'

module PlayerSpecHelper
  include GameText
  include SpecCommons

  def PlayerSpecHelper.check_cards_not_in_hand(cards, hand)
    result = true
    cards.each do |card|
      result = false if hand.has_card?(card)
    end
    result
  end

  def PlayerSpecHelper.compare_hands(player, hand)
    hand.each do |card|
      return false if !player.hand.cards.include?(card)
    end
    return true
  end

  def PlayerSpecHelper.generate_choose_play_text(player, input)
    string = "#{player.to_s}'s turn\n"
    string += "This is your hand:\n"
    string += "#{player.hand.to_s}"
    string += INSTR_FOR_CARD_PICKING
    string += "\nWhat card(s) would you like to play?\n"
    string += "#{input}\n"
  end

  def PlayerSpecHelper.parse_choose_play_input(input) #TODO remove
    string = ""
    input.each_with_index do |card, i|
      val = card.value + VALUE_OFFSET
      val -= VALUES.length if val > VALUES.length
      string += "#{val}#{SUITS[card.suit][0, 1].downcase}"
      string += ", " if i != input.length-1
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

  def PlayerSpecHelper.select_cards_not_in_hand(num_cards, hand)  #TODO maybe
    cards = []
    while cards.length < num_cards do
      card = rand(DECK_SIZE) while hand.has_card?(Card.new(card)) || cards.include?(card)
      cards << card
    end
    cards.map{|card| Card.new(card)}
  end

end
