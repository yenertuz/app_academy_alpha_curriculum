#require 'byebug'

# EASY

# Define a method that returns the sum of all the elements in its argument (an
# array of numbers).
def array_sum(arr)
	arr.reduce(0, :+)
end

# Define a method that returns a boolean indicating whether substring is a
# substring of each string in the long_strings array.
# Hint: you may want a sub_tring? helper method
def in_all_strings?(long_strings, substring)
	long_strings.each { |x| return false if x.include?(substring) == false }
	true
end

# Define a method that accepts a string of lower case words (no punctuation) and
# returns an array of letters that occur more than once, sorted alphabetically.
def non_unique_letters(string)
	string.chars.select { |x| ("a".."z").include?(x.downcase) && string.count(x) > 1 }.sort.uniq
end

# Define a method that returns an array of the longest two words (in order) in
# the method's argument. Ignore punctuation!
def longest_two_words(string)
	t = string.split.sort_by { |x| x.length }
	t.reverse[0..1]
end

# MEDIUM

# Define a method that takes a string of lower-case letters and returns an array
# of all the letters that do not occur in the method's argument.
def missing_letters(string)
	("a".."z").reject {|x| string.include?(x) }
end

# Define a method that accepts two years and returns an array of the years
# within that range (inclusive) that have no repeated digits. Hint: helper
# method?
def no_repeat_years(first_yr, last_yr)
	(first_yr..last_yr).select {|x| not_repeat_year?(x)}
end

def not_repeat_year?(year)
	v = year.to_s
	v.each_char {|x| return false if v.count(x) > 1}
	true
end

# HARD

# Define a method that, given an array of songs at the top of the charts,
# returns the songs that only stayed on the chart for a week at a time. Each
# element corresponds to a song at the top of the charts for one particular
# week. Songs CAN reappear on the chart, but if they don't appear in consecutive
# weeks, they're "one-week wonders." Suggested strategy: find the songs that
# appear multiple times in a row and remove them. You may wish to write a helper
# method no_repeats?
def one_week_wonders(songs)
	songs.select { |x| no_repeats?(x, songs) }.uniq
end

def no_repeats?(song_name, songs)
	t = (0..songs.length).select { |x| songs[x] == song_name}
	(0...(t.length - 1)).each {|i| return false if (t[i] - t[i + 1]).abs == 1 }
	true
end

# Define a method that, given a string of words, returns the word that has the
# letter "c" closest to the end of it. If there's a tie, return the earlier
# word. Ignore punctuation. If there's no "c", return an empty string. You may
# wish to write the helper methods c_distance and remove_punctuation.

def for_cs_sake(string)
	string = string.chars.reject {|x| ("a".."z").include?(x.downcase) == false && x != " "}.join
	string.split.reduce("") do | acc, ele |
		if acc == "" && ele.downcase.include?("c")
			ele
		elsif ele.downcase.include?("c") && c_distance(ele) < c_distance(acc)
			ele
		else
			acc
		end
	end
end

def c_distance(word)
	remove_punctuation(word).reverse.downcase.index("c")
end

def remove_punctuation(word)
	word.chars.select {|x| ("a".."z").include?(x.downcase) }.join.downcase
end

# Define a method that, given an array of numbers, returns a nested array of
# two-element arrays that each contain the start and end indices of whenever a
# number appears multiple times in a row. repeated_number_ranges([1, 1, 2]) =>
# [[0, 1]] repeated_number_ranges([1, 2, 3, 3, 4, 4, 4]) => [[2, 3], [4, 6]]

def repeated_number_ranges(arr)
	r = []
	i0 = 0
	while i0 < arr.length
		i1 = i0
		while (i1 < arr.length && arr[i1] == arr[i0])
			i1 += 1
		end
		r << [i0, (i1 - 1)]
		i0 = i1
	end
	r.reject { |c| c[0] == c[1] }
end

#test = ["da", "da", "di", "di", "di", "di", "do", "la", "la", "la"]
#puts no_repeats?("di", test)