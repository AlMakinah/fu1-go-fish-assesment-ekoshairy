# Use your previously implemented card deck
# Update Card Deck to be able to deal more than one card (at the beginning)

require './stack'
require './helper'
require './card'

class CardDeck
  include Comparable
  attr_accessor :cards # cards is a list of Card objects

  def initialize(cards = nil)
    if cards.nil?
      @cards = Stack.new
    else
      @cards = cards
    end
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
    # TODO: Use your helper.rb shuffle method for this.
  end

  def peek
    @cards.peek
  end

  def deal(num=1)  #removes first num elements and returns it.
    # TODO
  end

  def size
    @cards.size
  end

  def empty?
    @cards.size == 0
  end

  def to_s
    # print all elements in the stack, returning it to its original state afterward.
    # TODO
  end

  def <=>(other)
    deck1 = @cards.clone
    deck2 = other.cards.clone

    size_diff = deck1.size <=> deck2.size

    return size_diff if size_diff != 0

    while(!deck1.empty?)
      c1 = deck1.pop
      c2 = deck2.pop

      c_diff = c1 <=> c2

      return c_diff if c_diff != 0
    end

    return 0
  end
end

