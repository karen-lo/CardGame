# /lib/deuces.rb
# The game of Deuces

require_relative "deck"
require_relative "game"

start_game = nil
while start_game != "n" && start_game != "y"
	puts "Would you like to start a game of Deuces? (y/n)"
	start_game = gets.strip
end
exit if start_game == "n"

num_players = nil
while num_players != 2 && num_players != 3 && num_players != 4
	puts "How many players are there? (2/3/4)"
	num_players = gets.strip.to_i
end

@deck = Deck.new
@game = Game.new(@deck, num_players)
@game.play_game