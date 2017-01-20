# send to saher. exercise looks right? help with tests and solution!!!

require './card_deck'
require './player'
require './computer'

class GoFish

  attr_reader :deck, :players

  # starting a new game
  def initialize
    # first need a new card deck
    @deck = CardDeck.new
    @deck.shuffle
    @players = []
    createPlayers
  end

  def createPlayers
    # 3 computer players, 1 normal player. # player 0 is the normal player
    @players << Player.new(0, @deck.deal(5))
    (1..3).each do |n|
      p = ComputerPlayer.new(n, @deck.deal(5))
      #p.sortHand
      @players << p
    end
  end

  def gameOver
    numcards = @players.reduce(0) do |sum, e|
      sum + e.hand.size
    end
    return numcards == 0
  end

  def start
    # randomly select a player to start.
    turn = rand(0..3)

    while(not gameOver)  # game loop
        ask = @players[turn].play
        if ask   # if player still has cards
          player_asked = ask[0]
          card_asked = ask[1]
          cards_given = @players[player_asked].respond(card_asked, @deck)  #if card found
          result = @players[turn].respond_to_response(card_asked, cards_given, @deck)
          if (not result) # means next player's turn
            turn+=1
            turn = 0 if turn > 3
          end  
        else  # if player out of cards
          turn+=1
          turn = 0 if turn > 3
        end
    end

    # Now must calculate score.
    getScore
  end

  def getScore
    winner = @players.max_by(&:getBooks)
    puts "The winner is player #{winner.id}"
    winner
  end


end

# game = GoFish.new
# p game
# game.start


