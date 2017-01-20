require './base_player'


class ComputerPlayer < BasePlayer
  
  def initialize(id, hand)
    super(id, hand)
  end

  def play
    if not @hand.empty?
      puts "Player #{@id} is playing now"
      
      begin
        id = rand(0..3)
      end while (id == @id)

      
      card = @hand.sample.rank
      puts "Player #{@id} is asking Player #{id} for #{card}"

      return [id, card]
    end
  end

  
end