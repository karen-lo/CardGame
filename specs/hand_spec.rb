# /specs/hand_spend.rb
# Specs for the Hand class

require_relative '../lib/hand'
require_relative '../lib/deck'
require_relative 'hand_spec_helper'
require_relative 'spec_commons'

describe Hand do
  
  before :example do
    @deck = Deck.new
    @deck.shuffle_deck
    @hands = @deck.pass_out_hands(SpecCommons::DEFAULT_NUM_PLAYERS)
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
        card = HandSpecHelper.card_not_in_hand(@hand.cards)
        expect(@hand.has_card?(card)).to be false
      end
    end
  end

  describe "remove_cards" do
    context "given an array of Cards in the hand" do
      before :example do
        arr = []
        loop do
          i = rand(@hand.cards.length)
          arr << i if !arr.include?(i)
          break if arr.length == 5
        end
        @card_arr = arr.map{|x| @hand.cards[x]}
      end

      it "will remove those cards from the hand" do
        @hand.remove_cards(@card_arr)
        expect(HandSpecHelper.check_cards_not_in_hand(@card_arr, @hand)).to be true
      end
    end

    context "given an array of Cards not in the hand" do
      before :example do
        @card_arr = []
        loop do
          @card_arr << HandSpecHelper.card_not_in_hand(@hand.cards)
          break if @card_arr.length == 5
        end
      end

      it "will not remove those cards" do
        pre_remove = @hand.cards
        @hand.remove_cards(@card_arr)
        expect(@hand.cards).to eq(pre_remove)
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
