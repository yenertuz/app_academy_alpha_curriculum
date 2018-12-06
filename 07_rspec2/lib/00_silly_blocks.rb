def reverser(&test)
	t = test.call
	t.split.map {|x| x.reverse}.join(" ")
end

def adder(p1=1, &p2)
	p2.call + p1
end

def repeater(p1 = 1, &p2)
	p1.times { p2.call }
end