# EASY

# Return the argument with all its lowercase characters removed.
def destructive_uppercase(str)
	(str.split("").select { |c| ("a".."z").include?(c) == false } ).join
end

# Return the middle character of a string. Return the middle two characters if
# the word is of even length, e.g. middle_substring("middle") => "dd",
# middle_substring("mid") => "i"
def middle_substring(str)
	a = str.chars
	while (a.length >= 3)
		a.pop
		a.shift
	end
	a.join
end

# Return the number of vowels in a string.
VOWELS = %w(a e i o u)
def num_vowels(str)
(str.split("").select { |c| "aeiou".include?(c.downcase) }).length
end

# Return the factoral of the argument (num). A number's factorial is the product
# of all whole numbers between 1 and the number itself. Assume the argument will
# be > 0.
def factorial(num)
p = 1
(1..num).each { |c| p *= c }
p
end


# MEDIUM

# Write your own version of the join method. separator = "" ensures that the
# default seperator is an empty string.
def my_join(arr, separator = "")
r = ""
arr.each_with_index { |c, i| r += separator if i != 0; r += c.to_s }
r
end

# Write a method that converts its argument to weirdcase, where every odd
# character is lowercase and every even is uppercase, e.g.
# weirdcase("weirdcase") => "wEiRdCaSe"
def weirdcase(str)
	str.each_char.with_index { |c, i| i % 2 == 0 ? str[i] = str[i].downcase : str[i] = str[i].upcase }
	str
end

# Reverse all words of five more more letters in a string. Return the resulting
# string, e.g., reverse_five("Looks like my luck has reversed") => "skooL like
# my luck has desrever")
def reverse_five(str)
	(str.split.map { |c| c.length >= 5 ? c.reverse : c } ).join(" ")
end

# Return an array of integers from 1 to n (inclusive), except for each multiple
# of 3 replace the integer with "fizz", for each multiple of 5 replace the
# integer with "buzz", and for each multiple of both 3 and 5, replace the
# integer with "fizzbuzz".
def fizzbuzz(n)
	(1..n).map do |n|
		if n % 15 == 0
			"fizzbuzz"
		elsif n % 3 == 0
			"fizz"
		elsif n % 5 == 0
			"buzz"
		else
			n
		end
	end
end


# HARD

# Write a method that returns a new array containing all the elements of the
# original array in reverse order.
def my_reverse(arr)
	arr.reverse
end

# Write a method that returns a boolean indicating whether the argument is
# prime.
def prime?(num)
	return false if num == 1
	(2...num).each { |n| return false if num % n == 0 }
	true
end

# Write a method that returns a sorted array of the factors of its argument.
def factors(num)
	((1..num).select {|n| num % n == 0 } ).sort
end

# Write a method that returns a sorted array of the prime factors of its argument.
def prime_factors(num)
	factors(num).select { |n| prime?(n) }
end

# Write a method that returns the number of prime factors of its argument.
def num_prime_factors(num)
	prime_factors(num).length
end


# EXPERT

# Return the one integer in an array that is even or odd while the rest are of
# opposite parity, e.g. oddball([1,2,3]) => 2, oddball([2,4,5,6] => 5)
def oddball(arr)
	new_arr = arr.map { |n| n % 2}
	new_arr.count(0) == 1 ? arr[new_arr.index(0)] : arr[new_arr.index(1)]
end