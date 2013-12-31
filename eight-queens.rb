#definitely not pretty or elegant, needs refactoring and use of symmetry

$count = 0

def solve_eight_queens
  board = create_board
  count_open_spaces(board)
  get_open(board)

  place_queens(board, 8)
end

def place_queens(board, num_queens, visited = [])
  if num_queens == 0
    $count += 1
    return true
  elsif count_open_spaces(board) < num_queens
    return false
  else
    get_open(board).each do |space|      
      visited << space
      
      new_board = close_spaces(deep_dup(board), space, deep_dup(visited))
      place_queens(new_board, num_queens - 1, deep_dup(visited))
    end
  end
end

def deep_dup(board)
  new_board = []
  board.each do |row|
    new_board << row.dup
  end
  new_board
end

def close_spaces(board, space, visited)
  attacked_spaces(space).each do |closed|
    board[closed[0]][closed[1]] = false
  end
  visited.each do |closed|
    board[closed[0]][closed[1]] = false
  end

  board
end

def attacked_spaces(space)
  dirs = [[0,1],[1,0],[0,-1],[-1,0],[1,1],[-1,-1],[-1,1],[1,-1]]
  spaces = [space]
  
  dirs.each do |dir|
    current = [space[0] + dir[0], space[1] + dir[1]]
    until current[0] > 7 || current[1] > 7 || current[0] < 0 || current[1] < 0
      spaces << current
      current = [current[0] + dir[0], current[1] + dir[1]]
    end
  end
  spaces
end

def get_open(board)
  open = []
  8.times do |x|
    8.times do |y|
     open << [x, y] if board[x][y] 
    end
  end
  open
end


def count_open_spaces(board)
  board.flatten.select {|square| square}.length
end

def create_board
  board = []
  8.times do
    board << []
    8.times do
      board.last << true
    end
  end
  
  board
end

solve_eight_queens
  
p $count