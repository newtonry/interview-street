def closest_numbers(arr)
  arr.sort!
  best = [arr[1] - arr[0], []]
  
  (arr.length-1).times do |i|
    diff = arr[i+1] - arr[i]
    
    if diff == best[0]
      best[1] << arr[i] << arr[i + 1]
    elsif diff < best[0] 
      best[0] = diff
      best[1] = [arr[i], arr[i + 1]]
    end
  end
  best[1]
end

gets
arr = gets.strip.split(" ").map! {|i| i.to_i}
print closest_numbers(arr).join(" ")