#to run , bundle install then run -> rspec spec from the terminal

require 'spec_helper'

describe Card do 

  before :each do
    @card = Card.new "S", 1
  end

  describe "#new" do
    it 'takes two parameters and returns a Card objet' do
      expect(@card).to be_an_instance_of Card
    end
  end

  describe "#suit" do
    it "returns the correct suit" do
      expect(@card.suit).to eq("S")
    end

    it "sets the correct suit" do
      @card.suit = "D"
      expect(@card.suit).to eq("D")
    end
  end

  describe "#rank" do
    it "returns the correct rank" do
      expect(@card.rank).to eq(1)
    end

    it "sets the correct rank" do
      @card.rank = 5
      expect(@card.rank).to eq(5)
    end
  end

  describe "#to_s" do
    it "returns the string representation of the card" do
      expect(@card.to_s).to eq([1, "S"])
    end
  end
end


describe CardDeck do 

  before :each do
    @deck = CardDeck.new 
  end

  describe "#new" do
    it 'takes no parameters and returns a CardDeck object' do
      expect(@deck).to be_an_instance_of CardDeck
    end
  end

  describe "size" do
    it 'returns the size of the deck' do
      expect(@deck.size).to eq(52)
    end
  end

  describe "peek" do
    it 'returns the first element in the deck without removing it' do
      peek = @deck.cards.peek
      expect(@deck.peek).to eq(peek)
    end
  end

  describe "deal" do
    it 'returns the first element in the deck and removes it' do
      peek = @deck.cards.peek
      expect(@deck.deal[0]).to eq(peek)
      expect(@deck.size).to eq(51)
    end
  end

  describe "#shuffle" do
    it "should shuffle the deck" do
      olddeck = @deck.clone
      @deck.shuffle
      expect(olddeck).not_to eq(@deck)
    end
  end
end