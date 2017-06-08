# RELEASE 0
def search_array(arr,num)
  counter = 0

  arr.each do |item|
    if item != num
      counter += 1
    elsif item == num
      break
    end

    if counter == arr.length
      counter = nil
    end
  end

  counter
end

arr = [1, 42, 89, 23, 45]
p search_array(arr, 45)