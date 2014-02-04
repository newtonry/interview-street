require "set"

class WordChains
  def initialize(dictionary)
    generate_dictionary(dictionary)
  end
  
  def chain_words(start, finish)
    raise "Not a valid combo" if start.length != finish.length
    
    @dict_set = Set.new(@dictionary.select {|word| word.length == start.length })
    @visited_words = {}
    stack = get_adjacent(start)

    while !stack.empty?
      word = stack.shift
      
      if word == finish
        puts @visited_words[word] + [word]
        return "It was found!"
      end
      stack += get_adjacent(word)
    end
    p "There was no link :("
  end

  def get_adjacent(word)
    adj_words = @dict_set.select do |adj_word|
      is_adjacent?(word, adj_word) && !@visited_words.has_key?(adj_word)
    end
    
    adj_words.each do |adj_word|
      @visited_words[adj_word] = (@visited_words[word] || []) + [adj_word]
    end
    adj_words
  end

  def is_adjacent?(word1, word2)
    count = 0
    
    word1.length.times do |i|
      if word1[i] != word2[i]
        count +=1
        return false if count > 1
      end
    end
    true
  end

  private
  def generate_dictionary(dictionary)
    @dictionary = File.readlines(dictionary).map(&:chomp)
  end
end

w = WordChains.new('dictionary.txt')

t1 = Time.now
p w.chain_words('duck', 'ruby')
p Time.now - t1