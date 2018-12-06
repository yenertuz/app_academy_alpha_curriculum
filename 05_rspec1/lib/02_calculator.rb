def add(p1, p2)
	p1 + p2
end

def subtract(p1, p2)
	p1 - p2
end

def sum(arr)
	t = 0
	arr.each {|x| t += x}
	t
end

def multiply(p1, p2)
	p1 * p2
end

def power(p1, p2)
	return 1 if p2 == 0
	a = p1
	(p2 - 1).times do a *= p1 end
	a
end

def factorial(p1)
	return 1 if (0..1).include?(p1)
	p1 * factorial(p1 - 1)
end