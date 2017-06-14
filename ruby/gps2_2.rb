# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # Create an empty hash
  # Iterate through the list that the user provides
  # Save each item that you iterate through to the hash
  # Set default quantity to 1 and assign that to each that you iterate through
  # print the list to the console (optional for testing)
# output: a hash with the list


# Refactored line 15! 
def create_list (string_items)
	grocery_list = {}
	string_items.split(" ").each { |item| grocery_list[item] = 1}
	# puts grocery_list
	return grocery_list
end

# my_list = create_list("carrots apples cereal pizza")


# Method to add an item to a list
# input: list, item name, and optional quantity
# steps: add new items into list
# output: updated list

def add_item (grocery_list, item, quantity)
	grocery_list[item] = quantity
	return grocery_list
end

# my_updated_list = add_item(my_list, "water", 2)
# puts my_updated_list


# Method to remove an item from the list
# input: list, item name
# steps: remove item from list
# output: updated list

def remove_item (grocery_list, item)
	grocery_list.delete(item)
	return grocery_list
end

# my_updated_list = remove_item(my_updated_list, "pizza")
# puts my_updated_list


# Method to update the quantity of an item
# input: list, item name, quantity
# steps: update the quantity
# output: updated list

def update_quantity (grocery_list, item, quantity)
	grocery_list[item] = quantity
	return grocery_list
end

# my_updated_list = update_quantity(my_updated_list, "apples", 3)
# puts my_updated_list


# Method to print a list and make it look pretty
# input: grocery_list
# steps: iterate throught grocery_list and print each item name and quantity. Add tittle that says "My Grocery List"
# output: Pretty list on screen

# Refactored line 75!
def print_list (grocery_list)
	puts "My Grocery List"
	puts "---------------"
	puts "Item              Quantity"
	grocery_list.each {|item, quantity| puts "#{item}              #{quantity}"} 
end

# print_list(my_updated_list)



# D R I V E R   C O D E : R E L E A S E 2

new_list = create_list("")
add_item(new_list, "Lemonade", 2)
add_item(new_list, "Tomatoes", 3)
add_item(new_list, "Onions", 1)
add_item(new_list, "Ice Cream", 4)
puts new_list

remove_item(new_list, "Lemonade")
puts new_list

update_quantity(new_list, "Ice Cream", 1)
puts new_list

print_list(new_list)


