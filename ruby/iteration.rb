# --------------RELEASE 0--------------
# def print_method
#   puts "This is before the block."
#   yield("Gloria", "Michael")
#   puts "This is after the block."
# end

# print_method { |name1, name2| puts "#{name1 } and #{name2}." }


food = ["pizza", "tacos", "burger", "sushi", "tomato soup"]
usa_states = {
  "California" => "Sacramento",
  "Texas" => "Dallas",
  "Arizona" => "Phoenix",
  "New York" => "NYC"
}
# --------------RELEASE 1--------------
# puts "Original data"
# puts food
# puts usa_states

# food.each do |food_item|
#   puts "#{food_item}"
# end

# food.map! do |food_item|
#   puts "#{food_item.upcase}"
# end

# usa_states.each do |state, capital|
#   puts "State: #{state}, capital: #{capital}"
# end

# usa_states.map do |state, capital|
#   puts "#{state.upcase}"
#   puts "#{capital.upcase}"
# end

# puts "Final data"
# puts new_food
# p usa_states

# --------------RELEASE 2--------------
puts "Original data"
puts food
puts usa_states

#1
#food.delete_if { |food_item| food_item == "tacos"}
#2
#food.select! { |food_item| food_item.length > 5 }
#3
#food.keep_if { |food_item| food_item[0] == "t"}
#4
new_food=[]
new_food=food.take_while {|food_item| food_item.length <= 5 }

#1
#usa_states.delete_if { |state, capital| capital == "Dallas" }
#2
#usa_states.select! { |state, capital| state.length > 5 }
#3
#usa_states.keep_if { |state, capital| state[0] == "C" }
#4
#new_usa_states = {}
new_usa_states = usa_states.map do |state,capital|
  # puts "debug: #{state.length}"
  # puts state
  # puts capital
  if state.length <= 5
    break
  end
end

puts "Final data"
puts new_food
p new_usa_states
p usa_states