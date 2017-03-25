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
    suit_ranks = ['S', 'H', 'D', 'T']

    if @suit == other.suit
      return @rank <=> other.rank
    else
      return suit_ranks.index(other.suit) <=> suit_ranks.index(@suit)
    end
  end
end
