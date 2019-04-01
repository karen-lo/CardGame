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

  def find_winner
    winner = nil
    @players.each do |player|
      winner = player if player.hand.cards.empty?
    end
    winner
  end

  def play_game
    puts "\nStarting game...\n\n"
    deal_hands
    order_players
    
    # TODO
    prev_play = nil
    while find_winner == nil
      # prompt player for choice
      choice = @players[0].play_cards(prev_play) #TODO: indicate first play
      return #TO BE REMOVED

      prev_play = choice
      # rotate players at the end
      @players.rotate!
    end
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
    smallest_card_order = @players[0].hand.smallest_card.order
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
