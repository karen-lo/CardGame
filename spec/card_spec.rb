# card_spec.rb
# tests for the card class

require 'card'

describe Card do
  
  describe ".new" do
    context "given 1..4, 1..13" do
      it "returns a Card" do
        expect(Card.new(1, 2).should be_truthy)
      end
    end
  end

end
