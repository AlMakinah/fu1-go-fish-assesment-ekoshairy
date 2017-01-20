require './stack'
# Exercise 1
# Create a method, that takes as input an array, and sorts it. 
def sortArray(arr)
  # TODO # insertion sort
  final = [arr[0]]
  arr.delete_at(0)
  # main code
  for i in arr
      final_index = 0
      while final_index < final.length
          if i <= final[final_index]
              final.insert(final_index,i)
              break
          elsif final_index == final.length-1
              final.insert(final_index+1,i)
              break
          end
          final_index+=1
      end
  end
  # output
  final
end


# Exercise 2
# Create a method, that takes as input a sorted array, 
# and inserts an element into that array keeping it sorted.
def insert(arr, element)
  # TODO
  index = 0
  while index < arr.length
      if element <= arr[index]
          arr.insert(index,element)
          break
      elsif index == arr.length-1
          arr.insert(index+1,element)
          break
      end
      index+=1
  end
  arr
end



# Exercise 3
# Create a method that given a sorted array, searches for an element in that array.
def search(arr, element)
  # simplest way, go through them until current element is larger than one we're searching for.

  arr.each do |e|
    if e == element
      return e
    elsif e > element
      return false
    end
  end
  false
  # want something better? Checkout binary search
end


# Exercise 4
# We would like to shuffle a stack with the help of 2 other stacks. 
# How would you do that? Think of how you shuffle a card deck.
def shuffleStack(mystack)
  # TODO
  15.times do 
    s = Stack.new
    size = mystack.size
    while(mystack.size > size/2)
      s.push mystack.pop
    end

    shuffled = Stack.new
    while(mystack.size > 0 or s.size > 0)
      shuffled.push mystack.pop if mystack.size > 0
      shuffled.push s.pop if s.size > 0
    end

    mystack = shuffled
  end
  mystack

end




