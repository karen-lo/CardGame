# /lib/card.rb
# Class definition for a Card

require_relative 'commons'

class Card
  include Commons

  attr_accessor :order, :suit, :value

  def initialize(count)
    @order = count
    @suit = (count % SUITS.length) + 1
    @value = (count / SUITS.length) + 1
  end

  def equals?(card)
    card.order == @order
  end

  def to_s
    "#{VALUES[@value]} of #{SUITS[@suit]}"
  end

end

