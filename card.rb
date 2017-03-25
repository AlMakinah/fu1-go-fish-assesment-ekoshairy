# Represents a playing card
class Card
  include Comparable

  attr_accessor :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    [@rank, @suit]
  end

  def <=>(other)
    return @rank <=> other.rank if @suit == other.suit
    suit_ranks = %w(S H D T)

    suit_ranks.index(other.suit) <=> suit_ranks.index(@suit)
  end
end
