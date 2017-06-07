# --------------RELEASE 0--------------
puts "--------------RELEASE 0--------------"

def print_method
  puts "This is before the block."
  yield("Gloria", "Michael")
  puts "This is after the block."
end

print_method { |name1, name2| puts "#{name1 } and #{name2}." }

# --------------RELEASE 1--------------
puts "--------------RELEASE 1 each--------------"

food = ["pizza", "tacos", "burger", "sushi", "tomato soup"]
usa_states = {
  "California" => "Sacramento",
  "Texas" => "Dallas",
  "Arizona" => "Phoenix",
  "New York" => "NYC"
}

puts "Original data"
p food
p usa_states

food.each do |food_item|
  puts "#{food_item}"
end

usa_states.each do |state, capital|
  puts "State: #{state}, capital: #{capital}"
end

puts "Final data"
p food
p usa_states

# ----------------------------
puts "--------------RELEASE 1 map--------------"

puts "Original data"
p food
p usa_states

food.map! do |food_item|
  food_item.upcase
end

usa_states.map do |state, capital|
  state.upcase
  capital.upcase
end

puts "Final data"
p food
p usa_states

# --------------RELEASE 2--------------
puts "--------------RELEASE 2 array--------------"

food = ["pizza", "tacos", "burger", "sushi", "tomato soup"]

#1
puts "1."
p food
food.delete_if { |food_item| food_item == "tacos"}
p food
#2
puts "2."
p food
food.select! { |food_item| food_item.length > 5 }
p food
#3
puts "3."
p food
food.keep_if { |food_item| food_item[0] == "t"}
p food
#4
puts "4."
p food
new_food =  []
new_food = food.drop_while { |food_item| food_item.length <= 5 }
p new_food

# ----------------------------
puts "--------------RELEASE 2 hash--------------"

usa_states = {
  "California" => "Sacramento",
  "Texas" => "Dallas",
  "Arizona" => "Phoenix",
  "New York" => "NYC"
}

#1
puts "1."
p usa_states
usa_states.delete_if { |state, capital| capital == "NYC" }
p usa_states
#2
puts "2."
p usa_states
usa_states.select! { |state, capital| state.length > 5 }
p usa_states
#3
puts "3."
p usa_states
usa_states.keep_if { |state, capital| state[0] == "C" }
p usa_states
#4
puts "4."
usa_states["Ohio"] = "Columbus"
p usa_states
new_usa_states = {}
new_usa_states = usa_states.drop_while { |state, capital| state.length > 5 }
p new_usa_states

# ----------------------------