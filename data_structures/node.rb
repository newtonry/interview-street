class Node
  attr_accessor :value, :next_node, :key

  def initialize(value = nil, key = nil)
    @value = value
    @next_node = nil
    @key = key
  end
end