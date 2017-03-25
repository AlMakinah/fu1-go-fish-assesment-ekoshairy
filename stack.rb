# Represents a stack
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
    @data.length
  end

  def empty?
    size.zero?
  end

  def clone
    Stack.new(@data.dup)
  end
end
