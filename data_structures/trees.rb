class Node
  attr_accessor :value, :right, :left, :parent

  def initialize(value = nil, parent = nil, right = nil, left = nil)
    @value = value
    @right = right
    @left = left
    @parent = nil
  end
end


class BinarySearchTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end
  
  def insert(val)
    @root = insert_node(@root, val)
  end
  
  def insert_node(node, val)
    return Node.new(val) if !node
    
    if val < node.value
      node.left = insert_node(node.left, val)
      node.left.parent = node
    else
      node.right = insert_node(node.right, val)
      node.right.parent = node
    end
    
    return node
  end
  
  def find_successor(node)
    successor = node.right
    
    return left_most(successor) if successor
  end
  
  def next_largest(node)
    return left_most(node.right)  if node.right
      
    while true
      parent = node.parent
      return nil if !parent
      
      if node == parent.left
        return parent
      else
        node = parent
      end
    end
  end
  
  def left_most(node)
    current_node = node
    
    until !node.left
      current_node = node.left
    end
    return current_node
  end

  def is_balanced?(root = @root)
    balanced_weight(root) != -1
  end
  
  def balanced_weight(root)
    return 0 if !root
    
    left_weight = balanced_weight(root.left)
    right_weight = balanced_weight(root.right)

    if right_weight == -1 || left_weight == -1
      return -1
    end
    
    if (left_weight - right_weight)**2 > 1
      return -1
    end

    return left_weight + right_weight + 1
  end
  
  def print_tree
    stack = [@root]
    while !stack.empty?
      output = ''
      new_stack = []
      
      while !stack.empty?
        if stack[0] != nil
          output += stack[0].value.to_s + " "
          new_stack << stack[0].left << stack[0].right
        else
          output += "x "
        end
        stack.shift
      end
      p output
      
      stack += new_stack
    end
  end
end



bst = BinarySearchTree.new
bst.insert(10)
bst.insert(8)
bst.insert(11)
bst.insert(9)
bst.insert(7)
bst.insert(12)
bst.insert(6)
# p bst.root.left.right.value

bst.print_tree

# p bst.next_largest(bst.root.left.right).value

p bst.is_balanced?