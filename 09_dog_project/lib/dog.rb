class Dog
	def initialize(name, breed, age, bark, favorite_foods)
		@name = name
		@breed = breed
		@age = age
		@bark = bark
		@favorite_foods = favorite_foods 
	end 

	def bark
		return @bark.upcase if @age > 3
		@bark.downcase
	end

	def name
		@name
	end

	def age
		@age
	end 

	def favorite_foods 
		@favorite_foods
	end 

	def breed 
		@breed 
	end 

	def breed=(p1)
		@breed = p1 
	end 

	def bark=(p1)
		@bark = p1 
	end 

	def name=(p1)
		@name = p1 
	end 

	def age=(p1)
		@age = p1
	end 

	def favorite_foods=(p1)
		@favorite_foods = p1 
	end 

	def favorite_food?(p1)
		@favorite_foods.map {|x| x.downcase}.include?(p1.downcase)
	end
end
