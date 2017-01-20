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
        s1 = @player.hand.size
        @player.respond_to_response(2, [Card.new("H", 2)], @deck)
        expect(@player.hand.size - s1).to eq(1)
      end

      it "should not add card to the player's hand if no cards" do
        s1 = @player.hand.size
        @player.stub(:draw).and_return(false)
        @player.respond_to_response(2, nil, @deck)
        expect(@player.hand.size - s1).to eq(0)
      end
    end

    describe("draw") do
      it "should add card to the player's hand if found" do
        @deck.stub(:deal).and_return([Card.new("H", 2)])
        s1 = @player.hand.size
        @player.draw(2, @deck)
        expect(@player.hand.size - s1).to eq(1)
      end

      it "should return true if found" do
        @deck.stub(:deal).and_return([Card.new("H", 2)])
        expect(@player.draw(2, @deck)).to eq(true)
      end

      it "should add card to the player's hand if not found" do
        @deck.stub(:deal).and_return([Card.new("H", 3)])
        s1 = @player.hand.size
        @player.draw(2, @deck)
        expect(@player.hand.size - s1).to eq(1)
      end
      it "should return false if not found" do
        @deck.stub(:deal).and_return([Card.new("H", 3)])
        expect(@player.draw(2, @deck)).to eq(false)
      end
    end

    describe("checkBooks") do 
        it "should check if there is a book of a certain rank" do
            s1 = @player.books.size
            @player.hand << Card.new("T", 2)
            @player.hand << Card.new("D", 2)
            @player.checkBooks(2)
            expect(@player.books.size - s1).to eq(1)
        end

        it "should check if there is a book of a certain rank. remove from hand" do
            @player.hand << Card.new("T", 2)
            @player.hand << Card.new("D", 2)
            s1 = @player.hand.size
            @player.checkBooks(2)
            expect(s1 - @player.hand.size).to eq(4)
        end

        it "should check if there is a book of a certain rank and if not found wont add" do
            s1 = @player.books.size
            @player.checkBooks(2)
            expect(@player.books.size - s1).to eq(0)
        end

        it "should check if there is a book of any rank" do
            s1 = @player.books.size
            @player.hand << Card.new("T", 2)
            @player.hand << Card.new("D", 2)
            @player.checkBooks
            expect(@player.books.size - s1).to eq(1)
        end
        
    end

    describe("checkHand") do 
        it "should check if hand is empty, draws 5 more" do
            player2 = Player.new(0, [])
            player2.stub(:checkBooks).and_return(true)
            player2.checkHand(@deck)
            expect(player2.hand.size).to eq(5)
        end
        it "should check if hand is empty, if not won't draw" do
            player2 = Player.new(0, [Card.new("T",5)])
            player2.stub(:checkBooks).and_return(true)
            player2.checkHand(@deck)
            expect(player2.hand.size).to eq(1)
        end
    end

 
    

end

