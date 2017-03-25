class BasePlayer

  attr_reader :hand, :id, :books
  
  def initialize(id, hand)
    @id = id
    @hand = hand
    @books = []
  end
  
  def play
  end

  def sortHand
    # TODO
    # Use method in helper.rb here to sort the array @hand
  end

  def printHand
    @hand.each {|card| p card.to_s }
  end


  def respond(card_asked, deck)
    # TODO: check if player has that card!
    # card_asked is a rank (1/2/3/...)
    # deck is the card deck
    # Check if the player's hand contains that card. If it does, remove it from hand and return it.
    # Otherwise, print "Go Fish", and return false
    
  end

  def respond_to_response(card_asked, cards_given, deck)

    # TODO: 
    # if cards_given is not empty. (array of cards returned from other player)
      # add them to this player's hand.
      # Check if there are any books!
      # Check if I need to draw from the deck (if i have no more cards)
    # otherwise
      # cards_given empty so I draw from the deck. 

  end

  def draw(card_asked, deck)
    # TODO:
    # if the deck is not empty
      # draw one card
      # if that card was what player asked for
        # show card (print it)
        # add it to hand
        # check for books
        # check if i have no more cards, draw from deck
      # otherwise
        # add it to hand
        # check for books
        # check if i have no more cards, draw from deck

  end

  def check_books(rank=nil)

    # TODO:
    # if no rank is provided
      # check for any available books for any rank
      # when found, remove from hand and add to books
    # if rank is provided
      # check for a book in that rank.
      # when found , remove from hand and add to books

  end

  def check_hand(deck)
    # TODO
    # if hand is empty
      # draw 5 cards from the deck
      # don't forget to check for books!
  end

  def getBooks
    @books.size
  end

end
