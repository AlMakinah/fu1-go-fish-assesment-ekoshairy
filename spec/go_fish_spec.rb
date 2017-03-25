#to run , bundle install then run -> rspec spec from the terminal

require 'spec_helper'

describe GoFish do 

    before :each do
      @game = GoFish.new
    end

    describe "#new" do
      it 'takes one parameter and creates a Go Fish game' do
        expect(@game).to be_an_instance_of GoFish
      end
    end

    describe "#start" do
      # it 'takes input from user' do
      #   Player.any_instance.stub(play: [1,2])

      #   # STDIN.stub(:gets).and_return("1")
      #   # expect(STDIN).to receive(:gets).and_return('1')
      #   # expect(STDIN).to receive(:gets).and_return('2')
      #   @game.start
      # end
      it 'should stop when game is over' do
        allow(@game).to receive(:gameOver).and_return(true)
        expect(@game).to receive(:getScore)
        @game.start
      end
    end

    describe "#getScore" do
      it "should return player with highest number of books" do
        expect(@game.players[0]).to receive(:getBooks).and_return(1)
        expect(@game.players[1]).to receive(:getBooks).and_return(4)
        expect(@game.players[2]).to receive(:getBooks).and_return(8)
        expect(@game.players[3]).to receive(:getBooks).and_return(2)

        expect(@game.getScore).to eq(@game.players[2])
      end
    end

    describe "#createPlayers" do
      it "Should create 4 players" do
        expect(Player).to receive(:new).exactly(1).times
        expect(ComputerPlayer).to receive(:new).exactly(3).times
        expect(@game.players.size).to eq(4)
        @game.createPlayers
      end
    end

    

end

