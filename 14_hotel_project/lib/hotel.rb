require_relative "room"

class Hotel
  def initialize(p1, p2)
	@name = p1
	@rooms = {}
	p2.each {|k, v| @rooms[k] = Room.new(v)}
  end

  def name
	@name.split.map{|x| x.capitalize}.join(" ")
  end

  def rooms
	@rooms
  end

  def room_exists?(p1)
	@rooms.has_key?(p1)
  end

  def check_in(p1, p2)
	if ! (self.room_exists?(p2))
		print "sorry, room does not exists"
		return false
	elsif @rooms[p2].add_occupant(p1) == true
		print "check in successful"
		return true
	else
		print "sorry, room is full"
		return false
	end
  end

  def has_vacancy?
	@rooms.each_value { |v| return true if v.full? == false }
	false
  end

  def list_rooms
	@rooms.each { |k, v| print k + " : "; print v.available_space ; puts }
  end

end
