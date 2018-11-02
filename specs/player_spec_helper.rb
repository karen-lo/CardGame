# /specs/player_spec_helper.rb
# Module of helper functions for Player specs

module PlayerSpecHelper

  def PlayerSpecHelper.compare_hands(player, hand)
    hand.each do |card|
      return false if !player.hand.cards.include?(card)
    end
    return true
  end

end
