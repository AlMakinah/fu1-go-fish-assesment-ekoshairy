# Use your previously implemented card deck
# Update Card Deck to be able to deal more than one card (at the beginning)
class Stack

  def initialize
    @data = []
  end

  def push(val)
    @data.push val
  end

  def pop
    @data.pop
  end

  def peek
    @data[size - 1]
  end
  
  def size
    return @data.length
  end

end

class Card

  attr_accessor :suit, :rank

  def initialize(suit, rank)
    @suit = suit
    @rank = rank
  end

  def to_s
    [@rank, @suit]
  end

end

class CardDeck
  attr_accessor :cards # cards is a list of Card objects

  def initialize
    @cards = Stack.new
    initializeDeck
  end

  def initializeDeck
    suits = ['H', 'S', 'D', 'T']
    ranks = 1..13

    ranks.each do |r|
      suits.each do |s|
        @cards.push Card.new(s,r)
      end
    end
  end

  private :initializeDeck

  def shuffle
    # shuffling a stack @cards.shuffle!
  end

  def peek
    @cards.peek
  end

  def deal(num=1)  #removes first num elements and returns it.
    #@cards.slice!(- num, num)
    deal = []
    (1..num).each do |n|
      deal << @cards.pop
    end
    deal
  end

  def size
    @cards.size
  end

  def empty?
    @cards.size == 0
  end

  def to_s
    # print all elements in the stack, returning it to its original state afterward.
    # @cards.map do |c|
    #   c.to_s
    # end
  end

end


# deck = CardDeck.new
# deck.shuffle
# p deck.to_s
# p deck.peek.rank
# p deck.peek.to_s
# p deck.deal.to_s
# p deck.to_s
# p deck.size
