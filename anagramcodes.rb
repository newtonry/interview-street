word = gets.chomp

def palindrome_anagram(word)
  letter_count = Hash.new(0)
  
  word.each_char do |letter|
    letter_count[letter] = (letter_count[letter] + 1) % 2
  end

  count = letter_count.sort_by {|letter, count| -count}

  if count[1][1] != 0
    puts "NO"
  else
    puts "YES"
  end
end

palindrome_anagram(word)