# /specs/game_spec.rb
# Specs for the Game class

require_relative "../lib/game"
require_relative "game_spec_helper"

describe Game do
  describe ".new" do
    context "given a deck and number of players" do
      before :context do
        @deck = Deck.new
	@num_players = 3
        @game = Game.new(@deck, @num_players)
      end
      
      it "initializes the deck correctly" do
        expect(@game.deck).to eq(@deck)
      end

      it "intializes the number of players correctly" do
        expect(@game.num_players).to eq(@num_players)
      end
    end
  end

  describe ".make_player" do
    context "given that the game is initialized" do
      before :context do
        @deck = Deck.new
	@num_players = 3
	@game = Game.new(@deck, @num_players)
      end

      it "makes the correct number of players" do
        expect(@game.players.length).to eq(@num_players)
      end
    end
  end

  describe ".play_game" do
   
   context "given a game of two players" do
     before :context do
       @deck = Deck.new
       @num_players = 2
       @game = Game.new(@deck, @num_players)
       @game.play_game
     end

     it "passes out a hand to each player" do
       expect(GameSpecHelper.check_player_hands(@game.players)).to be true
     end

     it "starts with the player with the lowest card" do
       expect(GameSpecHelper.check_correct_first_player(@game.players)).to be true
     end

   end

   context "given a game of three players" do
     before :context do
       @deck = Deck.new
       @num_players = 3
       @game = Game.new(@deck, @num_players)
       @game.play_game
     end

     it "passes out a hand to each player" do
       expect(GameSpecHelper.check_player_hands(@game.players)).to be true
     end

     it "starts with the player with three of clubs" do
       expect(GameSpecHelper.check_correct_first_player(@game.players)).to be true
     end
   end
   
   context "given a game of four players" do
     before :context do
       @deck = Deck.new
       @num_players = 4
       @game = Game.new(@deck, @num_players)
       @game.play_game
     end

     it "passes out a hand to each player" do
       expect(GameSpecHelper.check_player_hands(@game.players)).to be true
     end

     it "starts with the player with three of clubs" do
       expect(GameSpecHelper.check_correct_first_player(@game.players)).to be true
     end
   end
  end
end
