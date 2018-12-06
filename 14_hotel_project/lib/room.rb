class Room
	def initialize(p1)
		@capacity = p1
		@occupants = []
	end

	def full?
		@occupants.length >= @capacity
	end

	def available_space
		return 0 if self.full?
		@capacity - @occupants.length
	end

	def add_occupant(p1)
		return false if self.full?
		@occupants << p1 
		true
	end

	def capacity
		@capacity
	end

	def occupants
		@occupants
	end
	
end
