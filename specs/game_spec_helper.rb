# /specs/game_spec_helper.rb
# Module of helper functions for Game specs

module GameSpecHelper
  THREE_OF_DIAMONDS = 2
  SUIT_SIZE         = 13
  DECK_SIZE         = 52

  def GameSpecHelper.check_player_hands(players)
    players.each do |player|
      return false if player.hand == nil
    end
    return true
  end

  def GameSpecHelper.check_correct_first_player(players)
    if players.length < 2 || players.length > 4
      raise 'Error: do not support this number of players'
    end
    
    if players.length > 2
      return players[0].hand.include?(Card.new(THREE_OF_DIAMONDS))
    end
    
    smallest_card = THREE_OF_DIAMONDS
    incr_value = 0
    while smallest_card < DECK_SIZE
      return true if players[0].hand.include?(Card.new(smallest_card))
      return false if players[1].hand.include?(Card.new(smallest_card))
      
      if smallest_card + SUIT_SIZE > DECK_SIZE-1
        incr_value += 1
        smallest_card = THREE_OF_DIAMONDS + incr_value
      else
        smallest_card += SUIT_SIZE
      end
    end
    return false
  end

end
