#to run , bundle install then run -> rspec spec from the terminal

require 'spec_helper'

describe "Helper Methods" do 

    
    describe "#sortArray" do
      it 'sorts an array' do
        expect(sortArray([6,3,4,5])).to eq([3,4,5,6])
      end

      it 'keeps sorted array as is' do
        expect(sortArray([1,2,3,4])).to eq([1,2,3,4])
      end
    end

    describe "#insert" do
      it 'inserts element in sorted array keeping it sorted' do
        expect(insert([3,6,7,9], 4)).to eq([3,4,6,7,9])
      end
    end

    describe "#search" do
      it 'returns false if element not found' do
        expect(search([3,6,7,9], 4)).to eq(false)
      end
      it 'returns element if found' do
        expect(search([3,6,7,9], 6)).to eq(6)
      end
    end

    describe "#shuffleStack" do
      it 'shuffles a stack' do
        s = Stack.new
        s.push(5)
        s.push(9)
        s.push(3)
        s.push(4)
        out = []
        shuffleStack(s)
        while s.size!=0
            out << s.pop
        end

        expect(out).not_to eq([4,3,9,5])
      end
    end


end

