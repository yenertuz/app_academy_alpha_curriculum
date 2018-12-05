def measure(p1=1, &p2)
	t1 = Time.now
	p1.times { p2.call }
	t2 = Time.now
	(t2 - t1) / p1.to_f
end