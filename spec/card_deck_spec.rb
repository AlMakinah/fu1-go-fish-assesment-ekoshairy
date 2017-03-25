#to run , bundle install then run -> rspec spec from the terminal

require 'spec_helper'

describe CardDeck do 
  before :each do
    @deck = CardDeck.new 
  end

  context "#new" do
    it 'takes no parameters and returns a CardDeck object' do
      expect(@deck).to be_an_instance_of CardDeck
    end
  end

  context "#size" do
    it 'returns the size of the deck' do
      expect(@deck.size).to eq(52)
    end
  end

  context "#peek" do
    it 'returns the first element in the deck without removing it' do
      peek = @deck.cards.peek
      expect(@deck.peek).to eq(peek)
    end
  end

  context "#deal" do
    it 'returns the first element in the deck and removes it' do
      peek = @deck.cards.peek
      expect(@deck.deal[0]).to eq(peek)
      expect(@deck.size).to eq(51)
    end
  end

  context "#shuffle" do
    it "should shuffle the deck" do
      olddeck = CardDeck.new(@deck.cards.clone)
      @deck.shuffle
      expect(olddeck).not_to eq(@deck)
    end
  end

  context '#to_s' do
    it 'should preserve the same card deck structure' do
      olddeck = @deck.clone
      @deck.to_s
      expect(olddeck <=> @deck).to eq(0)
    end
  end
end
