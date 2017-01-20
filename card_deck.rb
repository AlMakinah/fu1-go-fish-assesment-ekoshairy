# Use your previously implemented card deck
# Update Card Deck to be able to deal more than one card (at the beginning)

require './stack'
require './helper'
require './card'

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

end


