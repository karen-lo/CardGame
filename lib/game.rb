# /lib/game.rb
# Class definition for a Game

require_relative 'player'
require_relative 'deck'

class Game
  
  attr_accessor :num_players, :deck, :players

  def initialize(deck, num_players)
    @deck = deck
    
    @num_players = num_players
    @players = []
    
    make_players
  end

  def play_game
    deal_hands
  end

  private

  def deal_hands
    @deck.shuffle_deck
    hands = @deck.pass_out_hands(@num_players)
    @players.zip(hands).each do |player, hand|
      player.set_hand(hand)
    end
  end

  def make_players
    @num_players.times do |i|
      @players << Player.new(i)
    end
  end
end
