# EASY

# Define a method that, given a sentence, returns a hash of each of the words as
# keys with their lengths as values. Assume the argument lacks punctuation.
def word_lengths(str)
	h = {}
	str.split.each {|x| h[x] = x.length }
	h
end

# Define a method that, given a hash with integers as values, returns the key
# with the largest value.
def greatest_key_by_val(hash)
	hash.to_a.sort_by {|x| x[1]}[-1][0]
end

# Define a method that accepts two hashes as arguments: an older inventory and a
# newer one. The method should update keys in the older inventory with values
# from the newer one as well as add new key-value pairs to the older inventory.
# The method should return the older inventory as a result. march = {rubies: 10,
# emeralds: 14, diamonds: 2} april = {emeralds: 27, moonstones: 5}
# update_inventory(march, april) => {rubies: 10, emeralds: 27, diamonds: 2,
# moonstones: 5}
def update_inventory(older, newer)
	newer.each_key {|k| older[k] = newer[k] }
	older
end

# Define a method that, given a word, returns a hash with the letters in the
# word as keys and the frequencies of the letters as values.
def letter_counts(word)
	h = Hash.new(0)
	word.chars.each {|c| h[c] += 1}
	h
end

# MEDIUM

# Define a method that, given an array, returns that array without duplicates.
# Use a hash! Don't use the uniq method.
def my_uniq(arr)
	h = {}
	arr.each {|x| h[x] = 1}
	h.keys
end

# Define a method that, given an array of numbers, returns a hash with "even"
# and "odd" as keys and the frequency of each parity as values.
def evens_and_odds(numbers)
	h = Hash.new(0)
	h[:even] = numbers.select {|x| x.even? }.length
	h[:odd] = numbers.length - h[:even]
	h
end

# Define a method that, given a string, returns the most common vowel. Do
# not worry about ordering in the case of a tie. Assume all letters are 
# lower case.
def most_common_vowel(string)
	h = Hash.new(0)
	string.each_char {|c| h[c] += 1}
	h.sort_by {|k, v| v}[-1][0]
end

# HARD

# Define a method that, given a hash with keys as student names and values as
# their birthday months (numerically, e.g., 1 corresponds to January), returns
# every combination of students whose birthdays fall in the second half of the
# year (months 7-12). students_with_birthdays = { "Asher" => 6, "Bertie" => 11,
# "Dottie" => 8, "Warren" => 9 }
# fall_and_winter_birthdays(students_with_birthdays) => [ ["Bertie", "Dottie"],
# ["Bertie", "Warren"], ["Dottie", "Warren"] ]
def fall_and_winter_birthdays(students)
	arr = students.keys.select {|x| students[x] > 6 }
	arr.combination(2)
end

# Define a method that, given an array of specimens, returns the biodiversity
# index as defined by the following formula: number_of_species**2 *
# smallest_population_size / largest_population_size biodiversity_index(["cat",
# "cat", "cat"]) => 1 biodiversity_index(["cat", "leopard-spotted ferret",
# "dog"]) => 9
def biodiversity_index(specimens)
	h = Hash.new(0)
	specimens.each {|x| h[x] += 1 }
	nos = h.length
	largest = h.sort_by {|k, v| v}[-1][1]
	smallest = h.sort_by {|k, v| v}[0][1]
	(nos ** 2) * smallest / largest
end

# Define a method that, given the string of a respectable business sign, returns
# a boolean indicating whether pranksters can make a given vandalized string
# using the available letters. Ignore capitalization and punctuation.
# can_tweak_sign("We're having a yellow ferret sale for a good cause over at the
# pet shop!", "Leopard ferrets forever yo") => true
def can_tweak_sign?(normal_sign, vandalized_sign)
	h1 = character_count(normal_sign)
	h2 = character_count(vandalized_sign)
	h2.each_key {|k| return false if h1[k] < h2[k] }
	true
end

def character_count(str)
	h = Hash.new(0)
	str.each_char { |x| h[x.downcase] += 1 if ("a".."z").include?(x.downcase) }
	h
end
