require './card_deck'
require './player'
require './computer'

# GoFish game
class GoFish
  attr_reader :deck, :players

  # starting a new game
  def initialize
    # first need a new card deck
    @deck = CardDeck.new
    @deck.shuffle
    @players = []
    create_players
  end

  def create_players
    # 3 computer players, 1 normal player. # player 0 is the normal player
    @players << Player.new(0, @deck.deal(5))
    (1..3).each do |n|
      p = ComputerPlayer.new(n, @deck.deal(5))
      @players << p
    end
  end

  def game_over # game is over, when all player hands are empty.
    # TODO
  end

  def start
    # randomly select a player to start.
    turn = rand(0..3)

    until gameOver # game loop
      ask = @players[turn].play
      if ask # if player still has cards
        player_asked = ask[0]
        card_asked = ask[1]
        cards_given = @players[player_asked].respond(card_asked, @deck)
        result = @players[turn].respond_to_response(card_asked,
                                                    cards_given,
                                                    @deck)
        unless result # means next player's turn
          turn += 1
          turn = 0 if turn > 3
        end
      else # if player out of cards
        turn += 1
        turn = 0 if turn > 3
      end
    end

    # Now must calculate score.
    score
  end

  def score # winner is the player with the highest number of books.
    winner = @players.max_by(&:getBooks)
    puts "The winner is player #{winner.id}"
    winner
  end
end

# game = GoFish.new
# p game
# game.start
