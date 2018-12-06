class Bootcamp
	def initialize(name, slogan, student_capacity)
		@name = name 
		@slogan = slogan 
		@student_capacity = student_capacity 
		@teachers = []
		@students = []
		@grades = Hash.new {|h, k| h[k] = [] }
	end

	def name 
		@name 
	end 

	def name=(p1)
		@name = p1 
	end 

	def slogan 
		@slogan 
	end 

	def slogan=(p1)
		@slogan = p1 
	end 

	def student_capacity 
		@student_capacity 
	end 

	def student_capacity=(p1)
		@student_capacity = p1 
	end 

	def teachers
		@teachers 
	end 

	def teachers=(p1)
		@teachers = p1 
	end 

	def students 
		@students 
	end 

	def students=(p1)
		@students = p1 
	end 

	def enroll(name)
		return false if @students.length >= @student_capacity
		@students << name
		true
	end 

	def hire(name)
		@teachers << name 
	end 

	def enrolled?(name)
		@students.include?(name)
	end 

	def student_to_teacher_ratio 
		(@students.length / @teachers.length.to_f).floor
	end 

	def add_grade(name, number)
		return false if @students.include?(name) == false
		@grades[name] << number
		true
	end 

	def num_grades(name)
		@grades[name].length 
	end

	def average_grade(string)
		return nil if @grades[string].length == 0
		@grades[string].reduce(0) {|sum, num| sum + (num / @grades[string].length.to_f) }.floor	
	end

end
