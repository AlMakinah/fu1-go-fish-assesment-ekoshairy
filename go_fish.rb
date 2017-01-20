
# can add ability to choose number of players.


# sort hand 
# having deck as stack
# shuffle the stack.
# manually implement the slice function.
# if hand sorted, slicing will be more efficient. binary search. - or any method.
#missing : check that number is in hand, and player is 0-3 only.
# move card and card deck to separate files.
#THINGS TO FIX:
#END OF GAME, NOT WHEN DECK FINISHES, BUT WHEN DECK AND HANDS!!!!!
# inheritance - Player base class, has everything, and we have AI user implemented, them implement the rest
# try to move a lot of the exercises outside ...


require './card_deck'
require './player'

class GoFish

  attr_reader :deck, :players

  # starting a new game
  def initialize
    # first need a new card deck
    @deck = CardDeck.new
    @deck.shuffle
    #@num_of_players = 4
    @players = []
    # then must distibute cards and form table pile
    createPlayers
  end

  def createPlayers
    (0..3).each do |n|
      p = Player.new(n, @deck.deal(5))
      @players << p
    end
  end

  def start
    # randomly select a player to start.
    turn = rand(0..3)

    while(not @deck.empty?)  # game loop

        ask = @players[turn].play

        player_asked = ask[0]
        card_asked = ask[1]

        cards_given = @players[player_asked].respond(card_asked, @deck)  #if card found

        result = @players[turn].respond_to_response(card_asked, cards_given, @deck)

        if (not result) # means next player's turn
          turn+=1
          turn = 0 if turn > 3
        end  
    end

    # Now must calculate score.
    getScore
  end

  def getScore
    # COMPLETE
    winner = @players.max_by(&:getBooks)
    puts "The winner is #{winner}"
    winner
  end


end

game = GoFish.new
p game
game.start






   # if(card_given) # if card given = not false.. check
        #   # player plays again - turn stays the same.
        #   @players[turn].respond_to_response(card_given)
        #   puts "Play again"
        # else
          # make this a do while
          # Go Fish, take card from deck
        #   d = @players[turn].draw(card_asked, @deck)
        #   while(d) # keep drawing until don't get card. 
        #     d = @players[turn].draw(card_asked, @deck)
        #   end
        #   # player next to him plays 
        # end






