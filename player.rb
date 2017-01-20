require './base_player'
 
class Player < BasePlayer
  
  def initialize(id, hand)
    super(id, hand)
  end

  def play
    if not @hand.empty?
      puts "Hello Player #{@id}. These are your cards:"
      printHand
      
      begin
        puts "Select Player id you would like to ask"
        id = STDIN.gets.chomp.to_i
      end while (id < 0 or id > 3 or id == @id)
      
      
      begin
        puts "What would you like to ask player #{id} for?"
        card = STDIN.gets.chomp.to_i
      end while not @hand.index { |c| c.rank == card}

      return [id, card]
    end
  end


end