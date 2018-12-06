# EASY

# Write a method that returns the range of its argument (an array of integers).
def range(arr)
  arr.max - arr.min
end

# Write a method that returns a boolean indicating whether an array is in sorted
# order. Use the equality operator (==), which returns a boolean indicating
# whether its operands are equal, e.g., 2 == 2 => true, ["cat", "dog"] ==
# ["dog", "cat"] => false
def in_order?(arr)
  arr == arr.sort
end


# MEDIUM

# Write a method that returns the number of vowels in its argument
def num_vowels(str)
  (str.split("").select { |c| "aeiou".include?(c.downcase) } ).length
end

# Write a method that returns its argument with all its vowels removed.
def devowel(str)
	(str.split("").select { |c| "aeiou".include?(c.downcase) == false } ).join
end


# HARD

# Write a method that returns the returns an array of the digits of a
# non-negative integer in descending order and as strings, e.g.,
# descending_digits(4291) #=> ["9", "4", "2", "1"]
def descending_digits(int)
  int.to_s.split("").sort!.reverse
end

# Write a method that returns a boolean indicating whether a string has
# repeating letters. Capital letters count as repeats of lowercase ones, e.g.,
# repeating_letters?("Aa") => true
def repeating_letters?(str)
	return false if str == nil
  str.each_char.with_index { |c, i| return true if c.downcase == str[i + 1].to_s.downcase }
  false
end

# Write a method that converts an array of ten integers into a phone number in
# the format "(123) 456-7890".
def to_phone_number(arr)
  new = (arr.map { |x| x.to_s }).join
  "(" + new[0..2] + ") " + new[3..5] + "-" + new[6..-1]
end

# Write a method that returns the range of a string of comma-separated integers,
# e.g., str_range("4,1,8") #=> 7
def str_range(str)
  arr = str.split(",").map { |c| c.to_i }
  arr.max - arr.min
end


#EXPERT

# Write a method that is functionally equivalent to the rotate(offset) method of
# arrays. offset=1 ensures that the value of offset is 1 if no argument is
# provided. HINT: use the take(num) and drop(num) methods. You won't need much
# code, but the solution is tricky!
def my_rotate(arr, offset=1)
  # your code goes here
  offset >= 0 ? offset.times { arr = arr[1..-1] + [arr[0]] } : (offset * -1).times { arr = [arr[-1]] + arr[0...-1] }
  arr
end

print my_rotate(["a", "b", "c", "d"]); puts
print my_rotate(["a", "b", "c", "d"], 2); puts
print my_rotate(["a", "b", "c", "d"], -3); puts
print my_rotate(["a", "b", "c", "d"], 15); puts