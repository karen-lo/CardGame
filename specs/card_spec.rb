# /specs/card_spec.rb
# Specs for the Card class

require '../lib/card'

describe Card do
  
  describe ".new" do
    context "given value between 0 and 51" do
      it "returns a Card" do
        expect(Card.new(rand(0...52))).to be_truthy
      end
    end
  end

end
