# Pseudocode:
# Ask user to enter the details of the client in the following order:
# Ask for client's name
# Ask for client's birthdate (mm-dd-yyyy)
# Ask if client has a spouse or partner (true/false)
# Ask for number of children
# Ask for decor theme
# Ask for client's city
# Ask number of rooms
# Ask number of bathrooms
# Ask budget
# Format and print information entered by user
# Ask user what information needs updating
# If answer is 'none'
#     Skip updates
# Otherwise
#     Ask for the new value
#     Update corresponding key
# Print lastest version of information

design_client = {
}
# Data entry part
puts "Enter client's name"
design_client[:name] = gets.chomp
puts "Enter client's birthdate (mm-dd-yyyy)"
design_client[:birthdate] = gets.chomp
puts "Does the client have a spouse or partner? (yes/no)"
partner = gets.chomp
if partner == "yes"
  design_client[:partner] = true
else
  design_client[:partner] = false
end
puts "How many children does the client have? (use 0 for no childen)"
design_client[:num_children] = gets.to_i
puts "What's the decor theme?"
design_client[:decor_theme] = gets.chomp
puts "Enter client's city"
design_client[:city] = gets.chomp
puts "How many rooms in the house?"
design_client[:num_rooms] = gets.to_i
puts "How many bathrooms in the house?"
design_client[:num_bathrooms] = gets.to_f
puts "What the budget for the design project?"
design_client[:budget] = gets.chomp
puts "-------------------"
# Prints data entered
puts design_client
puts "-------------------"
# Asks for updates
puts "What information do you need to update? (enter key name or type 'none' to skip)"
update_key = gets.chomp
if update_key != "none"
  puts "Enter a new value for #{update_key}"
  new_value = gets.chomp
  # Formats new value
  if update_key == "partner" && new_value == "yes"
    new_value = true
  elsif update_key == "partner" && new_value == "no"
    new_value = false
  elsif update_key == "num_children" || update_key == "num_rooms"
    new_value = new_value.to_i
  elsif update_key == "num_bathrooms"
    new_value = new_value.to_f
  end
  # Updates hash with new value
  design_client[update_key.to_sym] = new_value
end
puts "-------------------"
# Prints final data
puts design_client
puts "-------------------"























