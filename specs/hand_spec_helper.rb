# /specs/hand_spec_helper.rb
# Module of helper functions for Hand specs

module HandSpecHelper
  def HandSpecHelper.check_to_string(hand_str, cards_arr)
    cards_arr.each do |card|
      return false if !hand_str.include? "[#{card.to_s}]"
    end
    return true
  end

  def HandSpecHelper.card_not_in_hand(cards_arr, deck_size)
    deck_size.times do |i|
      card = Card.new(i)
      return card if !cards_arr.include? card
    end
    return nil
  end
end
