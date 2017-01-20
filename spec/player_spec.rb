#to run , bundle install then run -> rspec spec from the terminal

require 'spec_helper'

describe Player do 

    before :each do
      hand = []
      @deck = CardDeck.new
      @one = Card.new("H", 1)
      @two = Card.new("H", 2)
      @three = Card.new("S", 2)
      @four = Card.new("H", 4)
      @five = Card.new("H", 5)
      #5.times {|i|  hand << Card.new("H", i)}
      hand = [@one, @two, @three, @four, @five]
      @player = Player.new(0, hand)
    end

    # describe "functions" do
    #   it "should have get, insert, delete" do
    #     expect(@hashtable).to respond_to(:insert)
    #     expect(@hashtable).to respond_to(:get)
    #     expect(@hashtable).to respond_to(:delete)
    #   end
    # end

    describe "#new" do
      it 'takes two parameter and creates a Player' do
        expect(@player).to be_an_instance_of Player
      end
    end

    describe "respond" do
      it 'should return player\'s matching cards if found ' do
        out = @player.respond(1, @deck)
        expect(out).to eq([@one])
      end
      it 'should return player\'s matching cards if more than one ' do
        out = @player.respond(2, @deck)
        expect(out).to eq([@two, @three])
      end
      it 'should remove player\'s matching cards from hand ' do
        s1 = @player.hand.size
        @player.respond(2, @deck)
        expect(s1 - @player.hand.size).to eq(2)
      end
      it 'should return false if not found' do
        out = @player.respond(6, @deck)
        expect(out).to eq(false)
      end
    end

    describe("respond_to_response") do
      it "should add card to the player's hand" do
        #respond_to_response(card_asked, cards_given, deck)
        
        #@player.respond_to_response(2, [@two, @three], @deck)
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

