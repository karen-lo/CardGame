# /specs/hand_spend.rb
# Specs for the Hand class

require_relative '../lib/hand'
require_relative '../lib/deck'
require_relative 'hand_spec_helper'

describe Hand do
  
  before :example do
    @deck = Deck.new
    @deck.shuffle_deck
    @hands = @deck.pass_out_hands(DEFAULT_NUM_PLAYERS)
    @hand = Hand.new(@hands[0])
  end
  
  describe ".new" do
    context "given an array of Cards" do
      it "keeps a copy of that array" do
        expect(@hand.cards).to eq(@hands[0])
      end

      it "has the correct sizeof the array" do
        expect(@hand.num_cards).to eq(@hands[0].length)
      end
    end
  end

  describe ".find_smallest_card" do
    context "given an array of Cards" do
      it "finds the smallest card" do
        expect(HandSpecHelper.check_smallest_card(@hand)).to be true
      end
    end
  end

  describe ".has_card?" do
    context "given a Card in the hand" do
      it "returns true" do
        expect(@hand.has_card?(@hand.cards[0])).to be true
      end
    end
    
    context "given a Card not in the Hand" do
      it "returns false" do
        card = HandSpecHelper.card_not_in_hand(@hand.cards, @deck.num_cards)
        expect(@hand.has_card?(card)).to be false
      end
    end
  end

  describe ".to_s" do
    context "given no parameters" do
      it "returns the string representation of the hand" do
        r = HandSpecHelper.check_to_string(@hand.to_s, @hand.cards)
        expect(r).to be true
      end
    end
  end  

end
