require './node.rb'

class LinkedList
  attr_accessor :head
  
  def initialize(head = nil)
    @head = head
  end
  
  def insert(value, key = nil)
    if !@head
      @head = Node.new(value, key)
    else
      new_node = Node.new(value, key)
      new_node.next_node = self.last.next_node
      self.last.next_node = new_node
    end
  end
  
  def find_by_key(key)
    visited = {}
    current_node = @head
    
    until !current_node || visited[current_node]
      return current_node if current_node.key == key
      visited[current_node] = true
      current_node = current_node.next_node
    end
    nil
  end
  
  def last
    return nil if !@head
    
    visited = {}
    current_node = @head
    
    until !current_node.next_node || visited[current_node.next_node]
      visited[current_node] = true
      current_node = current_node.next_node
    end
    
    current_node
  end
  
  def is_cylic?
    visited = {}
    current_node = @head
    
    until !current_node
      return true if visited[current_node]
      visited[current_node] = true
      current_node = current_node.next_node
    end
    false
  end
  
  def values
    current_node = @head
    visited = {}
    values = []
    
    until !current_node || visited[current_node]
      visited[current_node] = true
      values << current_node.value
      current_node = current_node.next_node
    end
    values
  end
  
  def to_s
    values.join(" -> ")
  end
end
# 
# ll = LinkedList.new
# ll.insert(15)
# ll.insert(5)
# ll.insert(10)
# ll.insert(4)
# 
# puts ll