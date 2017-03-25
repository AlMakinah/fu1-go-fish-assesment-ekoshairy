require './base_player'

# Represents a computer player
class ComputerPlayer < BasePlayer
  def initialize(id, hand)
    super(id, hand)
  end

  def play
    return if @hand.empty?

    puts "Player #{@id} is playing now"

    id = rand(0..3) while id == @id

    card = @hand.sample.rank
    puts "Player #{@id} is asking Player #{id} for #{card}"

    [id, card]
  end
end
