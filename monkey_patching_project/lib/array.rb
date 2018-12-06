# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
	return nil if self.empty?
	self.max - self.min
  end

  def average
	return nil if self.empty?
	self.reduce(:+) / self.length.to_f
  end

  def median
	return nil if self.empty?
	t = self.sort
	return self.sort[(self.length - 1) / 2] if self.length.odd?
	total = t[t.length / 2] + t[t.length / 2 - 1]
	total / 2.0
  end

  def counts
	h = Hash.new(0)
	self.each {|x| h[x] += 1}
	h
  end

  def my_count(p1)
	self.reduce(0) { |sum, num| num == p1 ? sum + 1 : sum }
  end

  def my_index(p1)
	self.each_with_index {|x, i| return i if x == p1 }
	nil
  end

  def my_uniq
	h = {}
	self.each {|x| h[x] = 1 }
	h.keys
  end

  def my_transpose
	r = []
	self.length.times {|x| r << [] }
	(0...self.length).each do |i1|
		(0...self.length).each do |i2|
			r[i1][i2] = self[i2][i1]
		end
	end
	r 
	end

end
