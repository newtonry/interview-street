require './linked_list.rb'

class RyHash
  attr_accessor :keys

  def initialize
    @keys = []
    @buckets = []
  end

  def add(key, value)
    @keys << key
    hash_value = RyHash.hashing_function(key)
    
    @buckets[hash_value] = (@buckets[hash_value] || LinkedList.new())
    @buckets[hash_value].insert(value, key)
  end

  def get(key)
    hash_value = RyHash.hashing_function(key)
    @buckets[hash_value].find_by_key(key).value
  end
 
  private
  def self.hashing_function(key)
    count = 16
    hash_value = 0
    key.to_s.each_char do |char|
      count -= 1
      break if count == 0
      
      hash_value += (char.ord - 'a'.ord) << (count % 4)
    end
    return hash_value
  end
end

hash = RyHash.new
hash.add('akey', 'someValue')
hash.add('stuff', 'a lot of valuable stuff')

p hash.get('stuff')