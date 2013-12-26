def lonelyinteger(arr)
  numbers = Hash.new(false)
  arr.each do |num|
    numbers[num] = !numbers[num]
  end
  
  lonely = numbers.select {|num, val| val}
  lonely.keys[0]
end

a = gets.strip.to_i
b = gets.strip.split(" ").map! {|i| i.to_i}
print lonelyinteger(b)