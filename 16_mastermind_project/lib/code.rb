class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(p1)
	p1.all? {|c| POSSIBLE_PEGS.keys.include?(c.upcase) }
  end

  def initialize(p1)
	if self.class.valid_pegs?(p1) == false
		raise "invalid peg"
		return 
	end
	@pegs = p1
	@pegs.map! { |x| x.upcase }
  end

  def self.random(p1)
	t1 = "." * p1
	t1 = t1.chars.map {|x| POSSIBLE_PEGS.keys.sample }
	Code.new(t1)
  end

  def self.from_string(p1)
	Code.new(p1.chars)
  end

  def [](p1)
	@pegs[p1]
  end

  def length
	@pegs.length
  end

  def num_exact_matches(p1)
	(0..p1.length).reduce(0) {|sum, num| self[num] == p1[num] ? sum + 1 : sum }
  end

  def num_near_matches(p1)
	p1.pegs.reduce(0) {|sum, num| self.pegs.include?(num) ? sum + 1 : sum } - self.num_exact_matches(p1)
  end

end
