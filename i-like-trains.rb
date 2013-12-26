def calc_train
  start = gets.chomp.split(" ").map {|num| num.to_i}
  travel_time = gets.chomp.split(" ").map {|num| num.to_i}

  add_hours = (start[1] + travel_time[1]) >= 60 ? 1 : 0
  mins = (start[1] + travel_time[1]) % 60

  hours = (start[0] + travel_time[0] + add_hours) % 24

  "#{hours/10}#{hours%10} #{mins/10}#{mins%10}"
end

puts calc_train