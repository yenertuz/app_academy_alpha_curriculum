class GuessingGame
	def initialize(p1, p2)
		@secret_num = rand(p1..p2)
		@game_over = false
		@num_attempts = 0
	end

	def num_attempts
		@num_attempts
	end

	def game_over?
		@game_over
	end

	def ask_user
		print "enter a number: "
		try = gets.chomp.to_i
		check_num(try)
	end

	def check_num(try)
		@num_attempts += 1
		if try == @secret_num
			puts "you win"
			@game_over = true
		elsif try < @secret_num
			puts "too small"
		else 
			puts "too big"
		end
	end
end
