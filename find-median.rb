midpoint = (gets.chomp.to_i/2)
nums = gets.split(' ').map {|num| num.to_i}.sort
median = nums[midpoint]

puts median