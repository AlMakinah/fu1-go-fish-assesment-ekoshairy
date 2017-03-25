require './base_player'

# Reperesents a human player
class Player < BasePlayer
  def initialize(id, hand)
    super(id, hand)
  end

  def play
    return if @hand.empty?
    puts "Hello Player #{@id}. These are your cards:"
    printHand

    while id < 0 || id > 3 || id == @id
      puts 'Select Player id you would like to ask'
      id = STDIN.gets.chomp.to_i
    end

    until @hand.index { |c| c.rank == card }
      puts "What would you like to ask player #{id} for?"
      card = STDIN.gets.chomp.to_i
    end

    [id, card]
  end
end
