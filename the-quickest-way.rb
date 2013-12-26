def quickest_path
  num_tests = gets.chomp.to_i
  
  inputs = []
  num_tests.times do
    inputs << get_input
  end

  inputs.each do |input|
    board = build_paths(input)
    puts find_quickest(board)
  end
end

def find_quickest(board)
  stack = [1]
  used_nodes = []
  visited = []
  count = 0
  
  while true
    while !stack.empty?
      return count + 1 if stack.first >= 93
      temp = stack.shift
      used_nodes << temp unless visited.include?(stack.first)
    end
    
    count +=1 

    while !used_nodes.empty?
      get_children(used_nodes.first, board).each do |child|
        stack << child unless stack.include?(child)
      end
      visited << used_nodes.shift
    end
  end
end

def get_children(pos, board)
  children = []
  6.times do |roll|
    children << board[pos + roll + 1]
  end
  children
end

def get_input
  gets
  ladders = gets.chomp.split(' ')
  snakes = gets.chomp.split(' ')
  snakes + ladders
end

def build_paths(input)
  board = {}
  100.times {|num| board[num + 1] = num + 1}
  
  input.each do |pair|
    p = pair.split(',').map {|x| x.to_i}
    board[p[0]] = board[p[1]]
  end
  board
end

def get_best_move(current, board)
  max = current
  6.times do |roll|
    max = board[current + (roll + 1)] if board[current + (roll + 1)] > max
  end
  max
end

quickest_path