# /specs/player_spec.rb
# Specs for the Player class

require_relative '../lib/player'
require_relative '../lib/deck'
require_relative 'player_spec_helper'

describe Player do

  describe ".new" do
    context " given an id number" do
      before :context do
        @id = rand
        @player = Player.new(@id)
      end
      
      it "creates a new Player" do
        expect(@player).to be_truthy
      end

      it "saves the right id number" do
        expect(@player.player_id).to eq(@id) 
      end
    end
  end

  # describe "play" do
  #   context "given an array of cards not in player's hand" do
  #     before :context do
  #       @deck = Deck.new
  #       @player = Player.new
  #       @deck.shuffle_deck
  #       @hand = @deck.pass_out_hands(DEFAULT_NUM_PLAYERS)[0]
  #       @player.set_hand(@hand)
  #       @choice = PlayerSpecHelper.select_cards_not_in_hand(1, @hand)
  #     end

  #     it "will not play the cards in the array" do
  #       expect(@player.play(@choice)).to be false
  #     end
  #   end

  #   context "given an array of 1 card in player's hand" do
  #     before :context do
  #       @deck = Deck.new
  #       @deck.shuffle_deck
  #       @player = Player.new
  #       @hand = @deck.pass_out_hands(DEFAULT_NUM_PLAYERS)[0]
  #       @player.set_hand(@hand)
  #       @choice = PlayerSpecHelper.select_cards_in_hand(1, @hand)
  #     end

  #     it "will play the card in the array" do
  #       expect(@player.play(@choice)).to be true
  #     end

  #     it "will remove the played card from the player's hand" do
  #       @player.play(@choice)
  #       r = PlayerSpecHelper.check_cards_not_in_hand(@choice, @hand)
  #       expect(r).to be false
  #     end
  #   end

  #   context "given an array of 2 cards in player's hand" do
      
  #   end

  #   context "given an array of 5 cards in player's hand" do
  #   end

  # end

  describe "set_hand" do
    context "given a Hand" do
      before :context do
        @id = rand
        @player = Player.new(@id)
        @deck = Deck.new
        @deck.shuffle_deck
        @hand = @deck.pass_out_hands(3)[0]
      end

      it "saves the Hand" do
        @player.set_hand(@hand)
        expect(PlayerSpecHelper.compare_hands(@player, @hand)).to be true
      end
    end
  end
end
