class Board

	attr_reader :size

  def initialize(p1)
	@grid = Array.new(p1) { Array.new(p1, :N) }
	@size = p1 ** 2
  end

  def [](p1)
	@grid[p1[0]][p1[1]]
  end
  
  def []=(p1, p2)
	@grid[p1[0]][p1[1]] = p2
  end

  def num_ships
	@grid.flatten.count(:S)
  end

  def attack(p1)
	a = self[p1]
	if a == :S 
		@grid[p1[0]][p1[1]] = :H
		puts "you sunk my battleship!"
		return true 
	else 
		self[p1] = :X
		return false 
	end
  end

  def place_random_ships
	n = @size / 4
	while n > 0
		i1 = rand(0...@grid[0].length)
		i2 = rand(0...@grid[0].length)
		if @grid[i1][i2] == :N 
			@grid[i1][i2] = :S
			n -= 1
		end
	end
  end

  def hidden_ships_grid
	@grid.map { |x| x.map {|y| y == :S ? :N : y } }
  end

  def self.print_grid(p1)
	p1.each { |x| puts x.join(" ") }
  end

  def cheat
	self.class.print_grid(@grid)
  end

  def print
	self.class.print_grid(self.hidden_ships_grid)
  end

end