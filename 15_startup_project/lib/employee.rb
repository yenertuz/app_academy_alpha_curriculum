class Employee

	attr_reader :name, :title

	def initialize(p1, p2)
		@name = p1
		@title = p2 
		@earnings = 0
	end 

	def pay(p1)
		@earnings += p1 
	end
end
