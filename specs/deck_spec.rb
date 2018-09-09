# tests for the Deck class

require_relative "../lib/deck"
require_relative "../lib/card"
require_relative "../lib/hand"
require_relative "deck_spec_helper"

describe Deck do
  
  describe ".new" do
    context "given no parameters" do
      it "returns a Deck" do
        expect(Deck.new).to be_truthy
      end
    end
  end

  describe ".print_deck" do
    context "given no paramters" do
      it "prints the entire deck of cards" do
        deck = Deck.new
	deck.num_cards.times do |i|
	  card_string = Card.new(i).serialize_card
	  expect(deck.serialize_deck).to include(card_string)
	end
      end
    end
  end

  describe ".shuffle_deck" do
    context "given no parameters" do
      it "mixes Deck class' array of Cards" do
        deck = Deck.new
        orig = deck.serialize_deck
        deck.shuffle_deck
        new = deck.serialize_deck
        expect(orig.eql?(new)).to be false
      end
    end
  end

  describe ".pass_out_hands" do

    context "given num_hands > 4 " do
      before :each do
        @deck = Deck.new
        @deck.shuffle_deck
        @num_hands = 5
      end
      
      it "gives an error" do
        expect{@deck.pass_out_hands(@num_hands)}.to raise_error(RuntimeError)
      end
    end

    context "given num_hands == 4" do
      before :context do
        @deck = Deck.new
        @deck.shuffle_deck
        @num_hands = 4
	@hands = @deck.pass_out_hands(@num_hands)
      end
      
      it "creates 4 hands" do
        expect(@hands.length).to eq(@num_hands)
      end

      it "equally divides cards" do
        result = DeckSpecHelper.
	         check_new_hand_sizes(@num_hands, @hands, @deck.num_cards)
        expect(result).to be true 
      end
    end

    context "given num_hands == 3" do
      before :context do
        @deck = Deck.new
        @deck.shuffle_deck
        @num_hands = 3
	@hands = @deck.pass_out_hands(@num_hands)
      end
      
      it "creates 3 hands" do
        expect(@hands.length).to eq(@num_hands)
      end

      it "somewhat equally divides the cards" do
        result = DeckSpecHelper.
	         check_new_hand_sizes(@num_hands, @hands, @deck.num_cards)
        expect(result).to be true 
      end

      it "gives the extra card the hand with the Three of Diamonds" do
        big_hand_sz = @deck.num_cards/@ret_num_hands + 1
        result = DeckSpecHelper.check_extra_card_placement(@hands, big_hand_sz) 
        expect(result).to be true
      end
    end
    
    context "given num_hands == 2" do
      before :context do
        @deck = Deck.new
        @deck.shuffle_deck
        @num_hands = 2
	@ret_num_hands = 3
	@hands = @deck.pass_out_hands(@num_hands)
      end
      
      it "creates 3 hands" do
        expect(@hands.length).to eq(@ret_num_hands)
      end

      it "somewhat equally divides the cards" do
        result = DeckSpecHelper.
	         check_new_hand_sizes(@ret_num_hands, @hands, @deck.num_cards)
        expect(result).to be true 
      end

      it "gives the extra card the hand with the Three of Diamonds" do
        big_hand_sz = @deck.num_cards/@ret_num_hands + 1
        result = DeckSpecHelper.check_extra_card_placement(@hands, big_hand_sz) 
        expect(result).to be true
      end
    end

    context "given num_hands < 2" do
      before :context do
        @deck = Deck.new
        @deck.shuffle_deck
        @num_hands = 1
      end

      it "gives an error" do
        expect{@deck.pass_out_hands(@num_hands)}.to raise_error(RuntimeError)
      end
    end
  end

end
