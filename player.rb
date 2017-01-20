class Player


  attr_reader :hand
  
  def initialize(id, hand)
    @id = id
    @hand = hand
    @books = []
    # type = auto if computer?
  end

  def play
    # should choose a person and rank to ask for.
    puts "Hello Player #{@id}. These are your cards:"
    printHand
    puts "Select Player id you would like to ask"
    # make appropriate checks for number..
    id = STDIN.gets.chomp.to_i
    puts "What would you like to ask player #{id} for?"
    # make appropriate checks that this player actually has card he's looking for.
    card = STDIN.gets.chomp.to_i
    return [id, card]
  end

  def printHand
    @hand.each {|card| p card.to_s }
  end


  def respond(card_asked, deck)

    # fix this, you return all cards found, not just first one!!!!

    # check if player has that card!
    card_index = @hand.select{ |c| c.rank == card_asked }  
    if not card_index.empty?
      @hand = @hand - card_index
      #c = @hand.slice!(card_index, 1) # return card and remove from hand.
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
        # make this a do while
        # Go Fish, take card from deck
        d = draw(card_asked, deck)
        #while(d) # keep drawing until don't get card. 
        # player next to him plays 
        #d  # if true , play again.
    end
    
    # also another condition. if get a book - show it to all and keep it. but don't play again (unless thats the card you were asking for)
  end

  def draw(card_asked, deck)

    # IF DECK NOT EMPTY!
    if not deck.empty?

      card = deck.deal[0]
      if(card.rank == card_asked)
        @hand << card
        puts "I got a #{card.rank} will play again"
        # if 4 - put in book!! and won't draw again - but ask for another number
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

    # also another condition. if get a book - show it to all and keep it. but don't play again (unless thats the card you were asking for)
  end


  def checkBooks(rank=nil)
    # if 4 cards of same rank, remove from @hand and add to @books
    if rank.nil?
      # check if there are books.
      temp_hand = @hand
      while not temp_hand.empty?
        
        r = temp_hand[0].rank
        
        if foundRank?(r, temp_hand)
          return true
        else
          temp_hand = temp_hand - book
        end

      end
      false
    else
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
      end
  end

  def checkHand(deck)
    # first check if no cards
    # check if deck has cards, take up to 5
    # then checkBooks!!

    if @hand.empty?
      #if not deck.empty?
       # while @hand.size < 5 && not deck.empty?
        # take up to 5 cards.
        @hand << deck.deal(5)
        @hand.flatten!
        checkBooks
        # checkBooks
        #end
      #end
    end

  end

  def getBooks
    @books.size
  end


end