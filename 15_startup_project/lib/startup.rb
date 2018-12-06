require "employee"

class Startup

	attr_reader :name, :funding, :salaries, :employees

	def initialize(p1, p2, p3)
		@name = p1 
		@funding = p2
		@salaries = p3
		@employees = []
	end

	def valid_title?(p1)
		salaries.keys.include?(p1)
	end

	def >(p1)
		self.funding > p1.funding
	end

	def hire(p1, p2)
		if valid_title?(p2) == false
			raise p2.to_s + " is an invalid title"
			return 
		end
		@employees << Employee.new(p1, p2)
	end

	def size
		employees.length
	end

	def pay_employee(p1)
		t = @salaries[p1.title]
		if @funding >= t
			p1.pay(t)
			@funding -= t
		else
			raise "cannot pay employee due to insufficient funds"
		end
	end

	def payday
		employees.each {|x| pay_employee(x) }
	end

	def average_salary
		sum = @employees.reduce(0) {|sum, num| sum + self.salaries[num.title] }
		sum / @employees.length.to_f
	end

	def close
		@employees = []
		@funding = 0
	end

	def acquire(p1)
		@funding += p1.funding
		p1.salaries.each_key { |k| @salaries[k] = p1.salaries[k] if @salaries.has_key?(k) == false }
		@employees += p1.employees
		p1.close
	end

end
