#chance of a person surviving after n steps on an island surrounded by lava
#the peron takes random steps

class Island
  @@DIRS = [[1,0],[-1,0],[0,1],[0,-1]]
  @@BEEN_THERE = Hash.new(false)
  
  def initialize(width, height)
    @width = width
    @height = height
  end
  
  def on_board(x, y)
    return false unless 0 <= x && x < @width
    return false unless 0 <= y && y < @height    
    true
  end
  
  def chance_of_surviving(x, y, n, depth = 1)
    return 0 if !on_board(x, y)
    return 1 * depth if n == 0

    #if this was already calculated
    key = "#{n}_#{x}_#{y}".to_sym
    return @@BEEN_THERE[key] if @@BEEN_THERE[key]
    
    chance_survival = 0
    depth /= 4.0
    
    @@DIRS.each do |dir|
      chance_survival += chance_of_surviving(x + dir[0], y + dir[1], n - 1, depth)
    end

    @@BEEN_THERE[key] = chance_survival
    return chance_survival
  end
  
  def print_visited
    p @@BEEN_THERE
  end
end


island_of_death = Island.new(10,10)
p island_of_death.chance_of_surviving(5,5,15)

