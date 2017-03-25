class Stack

  def initialize(data = [])
    @data = data
  end

  def push(val)
    @data.push val
  end

  def pop
    @data.pop
  end

  def peek
    @data[size - 1]
  end
  
  def size
    return @data.length
  end

  def empty?
    return self.size == 0
  end

  def clone
    Stack.new(@data.dup)
  end

end
