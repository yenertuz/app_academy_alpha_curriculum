require_relative "board"
require_relative "player"

class Battleship

	attr_reader :board, :player

	def initialize(p1)
		@player = Player.new 
		@board = Board.new(p1) 
		@remaining_misses = @board.size / 2 
	end
	
	def start_game
		@board.place_random_ships
		puts @board.num_ships
		@board.print
	end

	def lose?
		if @remaining_misses <= 0
			puts "you lose"
			return true 
		end
		false
	end

	def win?
		if @board.num_ships == 0
			puts "you win"
			true
		else 
			false 
		end
	end

	def game_over?
		win? || lose?
	end

	def turn 
		move = @player.get_move
		result = @board.attack(move)
		if result == false 
			@remaining_misses -= 1
		end
		@board.print 
		puts @remaining_misses
	end

end

Battleship.new(3).turn