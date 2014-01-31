def save_princess
  get_board
end

def get_board
  num_lines = gets.chomp.to_i

  m_pos = []
  p_pos = []
  
  num_lines.times do |row_ind|
    row = gets.chomp.split('')

    m_col = row.index('m')
    m_pos = [row_ind, m_col] if m_col

    p_col = row.index('p')
    p_pos = [row_ind, p_col] if p_col
  end

  calculate_steps(m_pos[0] - p_pos[0], m_pos[1] - p_pos[1])
end

def calculate_steps vert, hor
  vert_dir = vert < 0 ? "DOWN" : "UP"
  hor_dir = hor < 0 ? "RIGHT" : "LEFT"
  
  vert.abs.times { puts vert_dir }
  hor.abs.times { puts hor_dir }  
end

save_princess