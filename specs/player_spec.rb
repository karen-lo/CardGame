# /specs/player_spec.rb
# Specs for the Player class

require_relative "../lib/player"

describe Player do

  describe ".new" do
    context " given an id number" do
      before :context do
        @id = rand(0..4)
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
end
