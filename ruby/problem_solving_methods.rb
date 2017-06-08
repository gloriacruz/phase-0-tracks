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

# RELEASE 2
# Choose a simple sorting algorithm to learn about. Bubble sort or insertion sort are good ones for beginners.
# Pseudocode a sorting method that takes an array of integers and uses a sorting algorithm. The method should return a sorted version of the array. Your pseudocode should not be Ruby-specific.
# Implement the sorting method in Ruby.

# Pseudocoding using Bubble Sort:
# Determine the length of array
# Include a swap flag to notify program if swap is true or false
# Initialize loop for swaps
#   Iterate array until last value of array
#     If value is out of order swap them
#     Make a note that the swap occurred
# Swap is complete once the method returns a sorted version of the array

def bubble_sort(arr)
  size = arr.length
  swap = true
  until swap == false
    swap = false
    arr.each do |item|
      if arr[arr.index(item)+1] != nil #handle edge case at the end of the array
        if arr[arr.index(item)] > arr[arr.index(item)+1]
          small_value =  arr[arr.index(item)+1]
          arr[arr.index(item)+1] = arr[arr.index(item)]
          arr[arr.index(item)] = small_value
          swap = true
        end
      end
    end
  end
  arr
end

arr = [100,22,11,92,22,199,66,78]
p bubble_sort(arr)
arr = [100]
p bubble_sort(arr)
arr = [100,0]
p bubble_sort(arr)
arr = [1,2,3]
p bubble_sort(arr)



















