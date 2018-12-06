def echo(p1)
	p1
end

def shout(p1)
	p1.upcase
end

def repeat(p1, p2=2)
	( [p1] * p2 ).join(" ")
end

def start_of_word(p1, p2=1)
	p1[0...p2]
end

def first_word(p1)
	p1.split[0]
end

def titleize(p1)
	(p1.split.map.with_index {|x, i| i == 0 || ["over", "and", "the"].include?(x) == false || i == 0 ? x.capitalize : x.downcase }).join(" ")
end

print titleize("the bridge over the river kwai")