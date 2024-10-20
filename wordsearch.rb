# Create a 10x10 word search grid
grid_size = 10
grid = Array.new(grid_size) { Array.new(grid_size, '_') }

# Words to include in the word search
words = ["aizen", "rukia", "bankai"]

# Randomly place words in the grid
words.each do |word|
  placed = false
  while !placed
    # Random starting position
    row = rand(0...grid_size)
    col = rand(0...(grid_size - word.length))

    # Check if the space is empty to place the word
    if (0...word.length).all? { |i| grid[row][col + i] == '_' }
      word.chars.each_with_index { |char, index| grid[row][col + index] = char }
      placed = true
    end
  end
end

# Fill the remaining grid with random letters
('a'..'z').to_a.tap do |alphabet|
  grid.each_with_index do |row, i|
    row.each_with_index do |cell, j|
      grid[i][j] = alphabet.sample if cell == '_'
    end
  end
end

# Display the word search grid
grid.each { |row| puts row.join(' ') }

