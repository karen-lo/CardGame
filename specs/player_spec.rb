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
