# RELEASE 0
# Write a method that takes an array of integers and an integer to search for. The method should return the index of the item, or nil if the integer is not present in the array. Don't use built-in array methods.

def search_array(arr,num)
  counter = 0

  arr.each do |item|
    if item != num
      # if num is not found, keep going
      counter += 1
    elsif item == num
      # if num is found, stop the iteration
      break
    end

    # if we reached the end of the array without finding the num
    if counter == arr.length
      counter = nil
    end
  end

  counter
end

arr = [1, 42, 89, 23, 45]
p search_array(arr, 45)
p search_array(arr, 1)
p search_array(arr, 22)

# RELEASE 1
# Add a method to your file that takes a number of Fibonacci terms to generate and returns an array of the terms. For example, fib(6) would return [0,1,1,2,3,5]. Your method should work for a large number of terms.

def fib(num)
  # initial array
  array = [0,1]

  if num == 0
    array = [0] #edge special case
  elsif num == 1
    array = [0] #edge special case
  else
    pos = 2
    until array.length == num
      array[pos] = array[pos-2] + array[pos-1]
      pos += 1
    end
  end
  # if the final array is too long, only print the last number for verification purposes
  if array.length > 20
    array.last
  else
    array
  end

end

p fib(0)
p fib(1)
p fib(2)
p fib(6)
p fib(7)
p fib(98) + fib(99)
p fib(100)



















