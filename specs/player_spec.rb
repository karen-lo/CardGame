# /specs/player_spec.rb
# Specs for the Player class

require_relative '../lib/player'
require_relative '../lib/deck'
require_relative 'player_spec_helper'
require_relative 'spec_commons'

describe Player do

  describe ".new" do
    context "given an id number" do
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

  describe ".choose_play" do
    before :example do
      @player = Player.new(1)
      @deck = Deck.new
      @hands = @deck.pass_out_hands(SpecCommons::DEFAULT_NUM_PLAYERS)
      @player.set_hand(@hands[0])
    end

    context "given proper card-choosing syntax for 1 card" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(1, @player.hand)
        puts "cards: #{SpecCommons.card_array_to_s(@input)}"
        @input_str = PlayerSpecHelper.parse_choose_play_input(@input)
      end

      it "finds the corresponding cards chosen" do
        allow(@player).to receive(:gets).and_return(@input_str)
        s1 = SpecCommons.card_array_to_s(@player.choose_play)
        s2 = SpecCommons.card_array_to_s(@input)
        expect(s1).to eq(s2)
      end
    end

    context "given proper card-choosing syntax for 2 cards" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(2, @player.hand)
        puts "cards: #{SpecCommons.card_array_to_s(@input)}"
        @input_str = PlayerSpecHelper.parse_choose_play_input(@input)
      end

      it "finds the corresponding cards chosen" do
        allow(@player).to receive(:gets).and_return(@input_str)
        s1 = SpecCommons.card_array_to_s(@player.choose_play)
        s2 = SpecCommons.card_array_to_s(@input)
        expect(s1).to eq(s2)
      end
    end

    context "given proper card-choosing syntax for 5 cards" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(5, @player.hand)
        puts "cards: #{SpecCommons.card_array_to_s(@input)}"
        @input_str = PlayerSpecHelper.parse_choose_play_input(@input)
      end

      it "finds the corresponding cards chosen" do
        allow(@player).to receive(:gets).and_return(@input_str)
        s1 = SpecCommons.card_array_to_s(@player.choose_play)
        s2 = SpecCommons.card_array_to_s(@input)
        expect(s1).to eq(s2)
      end
    end

    context "given inproper card-choosing syntax" do
      it "finds the inproper syntax" do
      end
    end

    context "given inproper listing syntax" do
      it "delimits inappropriately, errors?" do
      end
    end
  end

  describe ".check_play" do
    context "given cards that are in hand" do
      it "returns the set of cards" do
      end

      it "removes the cards from the hand" do
      end
    end

    context "given cards that are not in hand" do
      it "reprompts user" do
      end
    end

    context "given correct number of cards" do
      it "" do
      end
    end
  end

  describe ".set_hand" do
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
