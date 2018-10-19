module GameSpecHelper

  def GameSpecHelper.check_player_hands(players)
    players.each do |player|
      return false if player.hand == nil
    end
    return true
  end

end
