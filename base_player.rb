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
    # check if player has that card!
    card_index = @hand.select{ |c| c.rank == card_asked }  
    if not card_index.empty?
      @hand = @hand - card_index
      checkHand(deck)
      card_index
    else
      puts "Go Fish"
      false
    end
  end

  def respond_to_response(card_asked, cards_given, deck)

    if(cards_given) # if card given = not false.. check
        # player plays again - turn stays the same.
        @hand << cards_given
        @hand.flatten!
        puts "I got #{cards_given[0].rank} will play again"
        checkHand(deck) if checkBooks(cards_given[0].rank)
        true # play again
    else
        # Go Fish, take card from deck
        d = draw(card_asked, deck)
    end
    
  end

  def draw(card_asked, deck)

    if not deck.empty?

      card = deck.deal[0]
      if(card.rank == card_asked)
        @hand << card
        puts "I got a #{card.rank} will play again"
        checkHand(deck) if  checkBooks(card.rank) #CONTINUE HEREEEE
        true # will play again
      else
        # won't play again
        @hand << card
        checkHand(deck) if checkBooks(card.rank)
        false
      end
    else
      false
    end

  end


  def checkBooks(rank=nil)
    # if 4 cards of same rank, remove from @hand and add to @books
    
    # When rank is not provided, look for a book in all ranks
    if rank.nil?
      temp_hand = @hand
      while not temp_hand.empty?
        r = temp_hand[0].rank
        book = foundRank?(r, temp_hand) 
        if book == true
          return true
        else
          temp_hand = temp_hand - book
        end
      end
      false
    else  # otherwise, search for just this rank.
      return foundRank?(rank, @hand)
    end

  end

  def foundRank?(rank, hand)
      book = hand.select do |card|
        card.rank == rank
      end

      if book.length == 4
        # remove from @hand
        @hand = @hand - book
        # add to book
        @books << book
        puts "I now have a new book of #{rank}s"
        true
      else
        book
      end
  end

  def checkHand(deck)
    if @hand.empty?
        @hand << deck.deal(5)
        @hand.flatten!
        checkBooks
    end
  end

  def getBooks
    @books.size
  end

end