#to run , bundle install then run -> rspec spec from the terminal

require 'spec_helper'

describe GoFish do 

    before :each do
      @game = GoFish.new
    end

    # describe "functions" do
    #   it "should have get, insert, delete" do
    #     expect(@hashtable).to respond_to(:insert)
    #     expect(@hashtable).to respond_to(:get)
    #     expect(@hashtable).to respond_to(:delete)
    #   end
    # end



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
      it 'should stop when deck is empty' do
        @game.deck.stub(:empty?).and_return(true)
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
        expect(Player).to receive(:new).exactly(4).times
        expect(@game.players.size).to eq(4)
        @game.createPlayers
      end
    end

    # describe("insert") do
    #   it 'should insert new value into the hashtable' do
    #     @hashtable.insert("key",4)
    #     expect(@hashtable.get("key")).to eq(4)
    #   end
    #   it 'should insert to the end of the hashtable'  do
    #     @hashtable.insert("key1", 4)
    #     @hashtable.insert("key2", 8)
    #     @hashtable.insert("key3",10)
    #     expect(@hashtable.size).to eq(3)
    #   end

    #   it 'should update existing value if key exists'  do
    #     @hashtable.insert("key1", 4)
    #     @hashtable.insert("key2", 8)
    #     @hashtable.insert("key1",6)
    #     expect(@hashtable.size).to eq(2)
    #     expect(@hashtable.get("key1")).to eq(6)
    #   end
    # end

    # describe("delete") do
    #   it 'should delete value from the hashtable' do
    #     @hashtable.insert("key1",4)
    #     @hashtable.insert("key2",8)
    #     @hashtable.insert("key3",10)
    #     @hashtable.delete("key2")
    #     expect(@hashtable.size).to eq(2)
    #     expect(@hashtable.get("key2")).to eq(false)
    #   end

    #   it 'should delete value from the hashtable at the end' do
    #     @hashtable.insert("key1",4)
    #     @hashtable.insert("key2",8)
    #     @hashtable.insert("key3",10)
    #     @hashtable.delete("key3")
    #     expect(@hashtable.size).to eq(2)
    #     expect(@hashtable.get("key3")).to eq(false)
    #   end

    #   it 'should delete value from the hashtable at the beginning' do
    #     @hashtable.insert("key1",4)
    #     @hashtable.insert("key2",8)
    #     @hashtable.insert("key3",10)
    #     @hashtable.delete("key1")
    #     expect(@hashtable.size).to eq(2)
    #     expect(@hashtable.get("key1")).to eq(false)
    #   end
    # end

    # describe("collisions") do
    #   it 'should handle collision' do
    #     expect(HashHelp).to receive(:hashit).at_least(:once).and_return(0)        
    #     @hashtable.insert("key1",4)
    #     @hashtable.insert("key2",8)
    #     @hashtable.insert("key3",10)
    #     expect(@hashtable.size).to eq(3)
    #     expect(@hashtable.get("key1")).to eq(4)
    #     expect(@hashtable.get("key2")).to eq(8)
    #     expect(@hashtable.get("key3")).to eq(10)
    #   end
    # end

    # describe("resizing hashtable") do
    #   it 'should halve the size of the hash table if less than quarter full' do
    #     expect(@hashtable.maxsize).to eq(8)
    #     @hashtable.insert("key1",4)
    #     @hashtable.insert("key2",8)
    #     @hashtable.delete("key2")
    #     expect(@hashtable.size).to eq(1)
    #     expect(@hashtable.maxsize).to eq(4)
    #   end

    #   it 'should double the size of the hash table if more than 75% full' do
    #     expect(@hashtable.maxsize).to eq(8)
    #     @hashtable.insert("key1",4)
    #     @hashtable.insert("key2",8)
    #     @hashtable.insert("key3",10)
    #     @hashtable.insert("key4",11)
    #     @hashtable.insert("key5",12)
    #     @hashtable.insert("key6",13)
    #     @hashtable.insert("key7",14)
    #     expect(@hashtable.size).to eq(7)
    #     expect(@hashtable.maxsize).to eq(16)
    #   end
    # end

    

end

