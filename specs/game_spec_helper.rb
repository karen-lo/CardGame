# /specs/game_spec_helper.rb
# Module of helper functions for Game specs

require_relative "spec_commons"

module GameSpecHelper
  include SpecCommons

  def GameSpecHelper.check_correct_first_player(players)
    if players.length < 2 || players.length > 4
      raise 'Error: do not support this number of players'
    end

    smallest_card = players[0].hand.smallest_card
    players.drop(1).each do |player|
      if player.hand.smallest_card.order < smallest_card.order
        smallest_card = player.hand.smallest_card
      end
    end
    puts "smallest card: #{smallest_card}"

    return players[0].hand.has_card?(smallest_card)
  end

  def GameSpecHelper.check_player_hands(players)
    players.each do |player|
      return false if player.hand == nil
    end
    return true
  end

end
