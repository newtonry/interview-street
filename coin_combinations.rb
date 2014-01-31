# target = 200
# 
# coin_sizes = [1,2,5,10,20,50,100,200]
# 
# ways = []
# ways[0] = 1
# 
# coin_sizes.each do |coin|
#   count = coin
#   while count <= target
#     ways[count] = ((ways[count] || 0) + ways[count - coin])
#     count += 1
#   end
# end
# 
# p ways


#version for hackerrank
def coin_change_problem
  coins = gets.chomp.split(", ").map{|val| val.to_i}
  target = gets.chomp.to_i
  
  puts get_num_possibilities(coins, target)
end

def get_num_possibilities(coin_set, target)
  num_ways = []
  num_ways[0] = 1
  
  coin_set.each do |coin|
    count = coin
    
    while count <= target
      num_ways[count] = (num_ways[count] || 0) + (num_ways[count - coin] || 0)
      count += 1
    end
  end
  num_ways.last
end

coin_change_problem




# p get_num_possibilities([1,2,5,10,20,50,100,200], 200)
# p get_num_possibilities([2, 5, 3, 6], 10)
