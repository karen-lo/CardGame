# /lib/game.rb
# Class definition for a Game

require_relative 'commons'
require_relative 'deck'
require_relative 'player'

class Game
  include Commons
  
  attr_accessor :deck, :num_players, :players

  def initialize(deck, num_players)
    @deck = deck
    @num_players = num_players
    @players = []
    make_players
  end

  def play_game
    deal_hands
    order_players
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

  def order_players
    start_player = 0
    smallest_card_order = @players.first.hand.smallest_card.order
    @players.drop(1).each.with_index(1) do |player, i|
      if player.hand.smallest_card.order < smallest_card_order
        start_player = i 
        smallest_card_order = player.hand.smallest_card.order
      end
    end
    
    i = 0
    while i != start_player
     @players.rotate!
      i += 1
    end
  end
end
