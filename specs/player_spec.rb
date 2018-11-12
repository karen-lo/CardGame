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

  describe ".check_play" do
    before :example do
      @id = rand
      @player = Player.new(@id)
      @deck = Deck.new
      @deck.shuffle_deck
      @hands = @deck.pass_out_hands(SpecCommons::DEFAULT_NUM_PLAYERS)
      @player.set_hand(@hands[0])
    end

    context "given cards that are in hand" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(1, @player.hand)
        @good_input = PlayerSpecHelper.parse_play_input(@input)
      end

      it "returns the set of cards as Cards" do
        allow(@player).to receive(:gets).and_return(@good_input)
        r = PlayerSpecHelper.compare_cards(@player.play_cards(nil), @input)
        expect(r).to be true
      end
    end

    context "given cards that are not in hand" do
      before :example do
        @bad_input = PlayerSpecHelper.select_cards_not_in_hand(1, @player.hand)
        @bad_input = PlayerSpecHelper.parse_play_input(@bad_input)
        @good_input = PlayerSpecHelper.select_cards_in_hand(1, @player.hand)
        @good_input = PlayerSpecHelper.parse_play_input(@good_input)
      end

      it "reprompts user" do
        allow(@player).to receive(:gets).and_return(@bad_input, @good_input)
        output = SpecCommons.capture_stdout {@player.play_cards(nil)}
        expect(output).to include("Please pick card(s) again")
      end
    end

    context "given correct number of cards" do
      it "" do
      end
    end
  end

  describe ".parse_choice" do
    before :example do
      @id = rand
      @player = Player.new(@id)
      @deck = Deck.new
      @deck.shuffle_deck
      @hands = @deck.pass_out_hands(SpecCommons::DEFAULT_NUM_PLAYERS)
      @player.set_hand(@hands[0])
    end

    context "given proper card-choosing syntax for 1 card" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(1, @player.hand)
        @input_str = PlayerSpecHelper.parse_play_input(@input)
      end

      it "finds the corresponding cards chosen" do
        allow(@player).to receive(:gets).and_return(@input_str)
        s1 = SpecCommons.card_array_to_s(@player.play_cards(nil))
        s2 = SpecCommons.card_array_to_s(@input)
        expect(s1).to eq(s2)
      end
    end

    context "given proper card-choosing syntax for 2 cards" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(2, @player.hand)
        @input_str = PlayerSpecHelper.parse_play_input(@input)
      end

      it "finds the corresponding cards chosen" do
        allow(@player).to receive(:gets).and_return(@input_str)
        s1 = SpecCommons.card_array_to_s(@player.play_cards(nil))
        s2 = SpecCommons.card_array_to_s(@input)
        expect(s1).to eq(s2)
      end
    end

    context "given proper card-choosing syntax for 5 cards" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(5, @player.hand)
        @input_str = PlayerSpecHelper.parse_play_input(@input)
      end

      it "finds the corresponding cards chosen" do
        allow(@player).to receive(:gets).and_return(@input_str)
        s1 = SpecCommons.card_array_to_s(@player.play_cards(nil))
        s2 = SpecCommons.card_array_to_s(@input)
        expect(s1).to eq(s2)
      end
    end

    context "given inproper card-choosing syntax for suit" do
      before :example do
        @bad_input = '1f'
        @good_input = PlayerSpecHelper.select_cards_in_hand(1, @player.hand)
        @good_input = PlayerSpecHelper.parse_play_input(@good_input)
      end

      it "prints error" do
        allow(@player).to receive(:gets).and_return(@bad_input, @good_input)
        output = SpecCommons.capture_stdout {@player.play_cards(nil)}
        expect(output).to include("Syntax error")
        expect(output).to include("not a valid suit")
      end

      it "reprompts user for new choice" do
        allow(@player).to receive(:gets).and_return(@bad_input, @good_input)
        output = SpecCommons.capture_stdout {@player.play_cards(nil)}
        expect(output).to include("Please pick card(s) again")
      end
    end

    context "given inproper card-choosing syntax for value (not numerics)" do #TODO write this
      before :example do
        @bad_input = 'sfd'
        @good_input = PlayerSpecHelper.select_cards_in_hand(1, @player.hand)
        @good_input = PlayerSpecHelper.parse_play_input(@good_input)
      end

      it "prints error" do
        allow(@player).to receive(:gets).and_return(@bad_input, @good_input)
        output = SpecCommons.capture_stdout {@player.play_cards(nil)}
        expect(output).to include("Syntax error")
        expect(output).to include("not only numerics")
      end

      it "reprompts user for new choice" do
        allow(@player).to receive(:gets).and_return(@bad_input, @good_input)
        output = SpecCommons.capture_stdout {@player.play_cards(nil)}
        expect(output).to include("Please pick card(s) again")
      end
    end

    context "given inproper card-choosing syntax for value (incorrect value)" do #TODO write this
      before :example do
        @bad_input = '45s'
        @good_input = PlayerSpecHelper.select_cards_in_hand(1, @player.hand)
        @good_input = PlayerSpecHelper.parse_play_input(@good_input)
      end

      it "prints error" do
        allow(@player).to receive(:gets).and_return(@bad_input, @good_input)
        output = SpecCommons.capture_stdout {@player.play_cards(nil)}
        expect(output).to include("Syntax error")
        expect(output).to include("Value is not valid")
      end

      it "reprompts user for new choice" do
        allow(@player).to receive(:gets).and_return(@bad_input, @good_input)
        output = SpecCommons.capture_stdout {@player.play_cards(nil)}
        expect(output).to include("Please pick card(s) again")
      end
    end
  end

  describe ".play_cards" do
    before :example do
      @id = rand
      @player = Player.new(@id)
      @deck = Deck.new
      @deck.shuffle_deck
      @hands = @deck.pass_out_hands(SpecCommons::DEFAULT_NUM_PLAYERS)
      @player.set_hand(@hands[0])
    end

    context "given cards that are in the hand" do
      before :example do
        @input = PlayerSpecHelper.select_cards_in_hand(5, @player.hand)
        @good_input = PlayerSpecHelper.parse_play_input(@input)
      end

      it "removes the cards from the hand" do
        allow(@player).to receive(:gets).and_return(@good_input)
        @player.play_cards(nil)
        r = PlayerSpecHelper.check_cards_not_in_hand(@input, @player.hand)
        expect(r).to be true
      end
    end
  end

  describe ".set_hand" do
    context "given an array of Cards" do
      before :context do
        @id = rand
        @player = Player.new(@id)
        @deck = Deck.new
        @deck.shuffle_deck
        @hand = @deck.pass_out_hands(3)[0]
      end

      it "saves the Hand" do
        @player.set_hand(@hand)
        expect(PlayerSpecHelper.compare_cards(@player.hand.cards, @hand)).to be true
      end
    end
  end
end
