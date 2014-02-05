class Heap
  attr_accessor :stack
  
  def initialize
    @stack = []
  end
  
  def add_node(value)
    @stack.push(value)
    
    current_ind = @stack.length - 1
    
    while current_ind != 0 && value > @stack[self.parent_index(current_ind)]
      @stack[self.parent_index(current_ind)], @stack[current_ind] = @stack[current_ind], @stack[self.parent_index(current_ind)]
      current_ind = self.parent_index(current_ind)
    end
  end
  
  def remove_largest_node
    @stack.shift
    @stack.unshift(@stack.pop)
    
    current_ind = 0
    
    child_ind = @stack[left_index(0)] > @stack[right_index(0)] ? left_index(0) : right_index(0)
    
    while @stack[child_ind] && @stack[current_ind] < @stack[child_ind]
      @stack[current_ind], @stack[child_ind] = @stack[child_ind], @stack[current_ind]
      current_ind = child_ind
    end
  end

  def left_index(index)
    2 * index + 1
  end
  
  def right_index(index)
    2 * index + 2
  end
  
  def parent_index(index)
    return nil if index == 0 
    return (index - 1) / 2
  end
end

h = Heap.new()

h.add_node(5)
h.add_node(7)
h.add_node(3)
h.add_node(4)
h.add_node(6)


h.remove_largest_node

h.add_node(8)

p h.stack
