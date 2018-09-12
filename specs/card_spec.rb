# /specs/card_spec.rb
# Specs for the Card class

require_relative '../lib/card'
require_relative 'card_spec_helper'

describe Card do
  
  describe ".new" do
    context "given value between 0 and 51" do
      it "returns a Card with correct suit and value" do 
	expect(CardSpecHelper.check_new_cards(Card::VALUES.length)).to be true
      end
    end
  end

  describe ".to_s" do
    context "given no parameters" do
      it "returns the correct string representation of the Card" do
        r = CardSpecHelper.check_to_string(Card::SUITS, Card::VALUES)
	expect(r).to be true
      end
    end
  end

end
