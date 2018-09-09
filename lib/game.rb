# hand.rb
# Class definition for a Game

require_relative 'player'
require_relative 'deck'

class Game
  
  attr_accessor :num_players

  def initialize(deck, num_players)
    @deck = deck
    
    @num_players = num_players
    @players = []
    
    make_players
  end

  def make_players
    @num_players.times do |i|
      @players << Player.new(i)
    end
  end

  def play_game
    @deck.shuffle_deck
    hands = @deck.pass_out_hands
  end

end
