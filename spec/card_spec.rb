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