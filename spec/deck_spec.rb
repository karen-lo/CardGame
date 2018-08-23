# deck_spec.rb
# tests for the Deck class

require "../lib/deck"

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
      end
    end
  end

end
