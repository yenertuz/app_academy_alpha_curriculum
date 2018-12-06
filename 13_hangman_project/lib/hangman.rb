class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
	DICTIONARY.sample
  end

  def initialize
	@secret_word = self.class.random_word
	@attempted_chars = Array.new
	@remaining_incorrect_guesses = 5
	@guess_word = ["_"] * @secret_word.length
  end



  def already_attempted?(p1)
	@attempted_chars.include?(p1.downcase)
  end

  def game_over?
	if self.win? || self.lose?
		puts "The word was #{@secret_word}"
		return true
	end
	false
  end

  def get_matching_indices(p1)
	(0...@secret_word.length).select { |i| @secret_word[i] == p1.downcase }
  end

  def remaining_incorrect_guesses
	@remaining_incorrect_guesses
  end

  def attempted_chars
	@attempted_chars
  end

  def guess_word
	@guess_word
  end

  def win?
	(puts "YOU WIN"; return true) if @guess_word.join == @secret_word
	false
  end

  def lose?
	(puts "YOU LOSE" ; return true ) if @remaining_incorrect_guesses <= 0
	false
  end

  def try_guess(p1)
	if self.already_attempted?(p1)
		print "that has already been attempted"
		return false
	end
	@attempted_chars << p1
	i = self.get_matching_indices(p1)
	if i.length == 0
		@remaining_incorrect_guesses -= 1
	else
		self.fill_indices(p1, i)
	end
	true
  end

  def fill_indices(p1, p2)
	p2.each {|x| @guess_word[x] = p1 }
  end

  def ask_user_for_guess
	print "Enter a char:"
	guess = gets.chomp
	return try_guess(guess)
	if already_attempted?(guess)
		print "that char has already been guessed"
		false
	end
	@remaining_incorrect_guesses -= 1 if try_guess(guess) == false
	get_matching_indices(guess).each {|x| @guess_word[x] = guess }
	@attempted_chars << guess
	true
end

end
