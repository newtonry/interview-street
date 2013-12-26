def missing_nums
  gets
  a = gets.chomp.split(' ').map {|num| num.to_i}
  gets
  b = gets.chomp.split(' ').map {|num| num.to_i}

  missing = Hash.new(0)

  a.each do |num|
    missing[num] +=1
  end
  b.each do |num|
    missing[num] -=1
  end

  missing.select {|num, val| val != 0}.keys.sort.join(" ")
end

puts missing_nums