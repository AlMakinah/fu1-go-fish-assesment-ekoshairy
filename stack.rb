class Stack

  def initialize
    @data = []
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

end