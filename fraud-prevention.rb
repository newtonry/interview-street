def fraud_checker
  deals = {}
  frauds = []

  num_input = gets.chomp.to_i
  num_input.times do 
    inp = gets.chomp.split(',')
    deal_id = inp[1]
  
    entry = {}
    entry[:ord_id] = inp[0]
    entry[:email] = process_email(inp[2])
    entry[:full_address] = full_add(inp[3], inp[4], inp[5], inp[6])
    entry[:credit_card] = inp[7]

    deals[deal_id] = deals[deal_id] || []
    deals[deal_id] << entry
  end
  
  deals.each do |deal_id, orders|
    frauds = frauds.concat(check_dups(orders))
  end
  frauds.uniq.sort.join(',')
end

def check_dups(orders)
  frauds = []
  orders.sort_by! {|order| order[:full_address] }
  orders[0..-2].each_with_index do |order, i|
    if order[:full_address] == orders[i+1][:full_address] && order[:credit_card] != orders[i+1][:credit_card]
      frauds << order[:ord_id].to_i << orders[i+1][:ord_id].to_i
    end 
  end
  
  orders.sort_by! {|order| order[:email]}
  orders[0..-2].each_with_index do |order, i|
    if order[:email] == orders[i+1][:email] && order[:credit_card] != orders[i+1][:credit_card]
      frauds << order[:ord_id].to_i << orders[i+1][:ord_id].to_i
    end 
  end
  frauds
end

def process_email(email)
  new_email = email.downcase.gsub('.', '').split("@").map do |segment|
    segment[0..((segment.index('+') || 0) - 1)]
  end.join('@')
end

def full_add(address, city, state, zip)
  full_add = [process_add(address), city, process_state(state), process_zip(zip)].join(',').downcase
end

def process_add(address)
  abbrevs = {'St.' => 'Street', 'Rd.' => 'Road'}

  abbrevs.each do |k, v|
    address.gsub!(k, v)
  end
  
  address
end

def process_state(state)
  abbrevs = {'Illinois' => 'IL', 'California' => 'CA', 'New York' => 'NY'}

  abbrevs.each do |k, v|
    state.gsub!(k, v)
  end
  
  state
end

def process_zip(zip)
  zip[0..((zip.index('-') || 0) - 1)]
end

puts fraud_checker