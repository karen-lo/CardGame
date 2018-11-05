# /specs/game_spec.rb
# Specs for the Game class

require_relative "../lib/game"
require_relative "game_spec_helper"
require_relative "spec_commons"

describe Game do
  describe ".new" do
    context "given a deck and number of players" do
      before :context do
        @deck = Deck.new
        @game = Game.new(@deck, SpecCommons::DEFAULT_NUM_PLAYERS)
      end
      
      it "initializes the deck correctly" do
        expect(@game.deck).to eq(@deck)
      end

      it "intializes the number of players correctly" do
        expect(@game.num_players).to eq(SpecCommons::DEFAULT_NUM_PLAYERS)
      end
    end
  end

  describe ".make_player" do
    context "given that the game is initialized" do
      before :context do
        @deck = Deck.new
        @game = Game.new(@deck, SpecCommons::DEFAULT_NUM_PLAYERS)
      end

      it "makes the correct number of players" do
        expect(@game.players.length).to eq(SpecCommons::DEFAULT_NUM_PLAYERS)
      end
    end
  end

  describe ".find_winner" do
    context "given a game where a player has an empty hand" do
      before :context do
        @deck = Deck.new
        @game = Game.new(@deck, SpecCommons::DEFAULT_NUM_PLAYERS)
        @hands = @deck.pass_out_hands(SpecCommons::DEFAULT_NUM_PLAYERS)
        GameSpecHelper.pass_out_hands(@game.players, @hands)
        @game.players[0].hand.cards = []
        @winner = @game.players[0]
      end

      it "returns true" do
        expect(@game.find_winner).to eq(@winner)
      end
    end

    context "given a game where no player has an empty hand" do
      before :context do
        @deck = Deck.new
        @game = Game.new(@deck, SpecCommons::DEFAULT_NUM_PLAYERS)
        @hands = @deck.pass_out_hands(SpecCommons::DEFAULT_NUM_PLAYERS)
        GameSpecHelper.pass_out_hands(@game.players, @hands)
      end

      it "returns false" do
        expect(@game.find_winner).to be_nil
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
        r = GameSpecHelper.check_correct_first_player(@game.players)
        expect(r).to be true
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

      it "starts with the player with the lowest card" do
        r = GameSpecHelper.check_correct_first_player(@game.players)
        expect(r).to be true
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

      it "starts with the player with the lowest card" do
        r = GameSpecHelper.check_correct_first_player(@game.players)
        expect(r).to be true
      end
    end
  end
end
