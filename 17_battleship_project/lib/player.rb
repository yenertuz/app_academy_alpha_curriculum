class Player
	def get_move
		puts "enter a position with coorinates separated with a space like `4 7`"
		input = gets.chomp
		input.split.map{|x| x.to_i }
	end

end
