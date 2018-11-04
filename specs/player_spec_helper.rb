# /specs/player_spec_helper.rb
# Module of helper functions for Player specs

module PlayerSpecHelper

	def PlayerSpecHelper.check_cards_not_in_hand(cards, hand)
		result = true
		cards.each do |card|
			result = false if hand.has_card?(card)
		end
		result
	end

  def PlayerSpecHelper.compare_hands(player, hand)
    hand.each do |card|
      return false if !player.hand.cards.include?(card)
    end
    return true
  end

	def PlayerSpecHelper.select_cards_in_hand(num_cards, hand)
  	cards = []
  	while cards.length < num_cards do
  		card = hand.sample while cards.include?(card)
  		cards << card
  	end
  	cards
  end

  def PlayerSpecHelper.select_cards_not_in_hand(num_cards, hand)
  	cards = []
  	while cards.length < num_cards do
  		card = rand(DECK_SIZE) while hand.has_card?(Card.new(card)) || cards.include?(card)
  		cards << card
  	end
  	cards.map{|card| Card.new(card)}
  end

end
