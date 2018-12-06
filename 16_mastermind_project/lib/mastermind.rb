require_relative "code"

class Mastermind

	def initialize(p1)
		@secret_code = Code.random(p1)
	end

	def print_matches(p1)
		puts "exact matches: #{@secret_code.num_exact_matches(p1)}"
		puts "near matches: #{@secret_code.num_near_matches(p1)}"
	end

	def ask_user_for_guess
		print "Enter a code: "
		input = gets.chomp
		input_code = Code.from_string(input)
		self.print_matches(input_code)
		@secret_code == input_code
	end

end
