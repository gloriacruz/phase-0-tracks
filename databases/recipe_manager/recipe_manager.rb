require_relative 'crud'

def add_new_recipe()
  puts 'ADD NEW RECIPE'
  puts '--------------'

  puts "Title of the recipe:"
  title = gets.chomp

  puts "Enter the instructions:"
  instructions = gets.chomp

  puts "Select a category:"
  Crud.get_all_categories.each do |category|
    puts "#{category['id']}. #{category['name']}"
  end
  category_id = gets.chomp

  new_id = Crud.add_new_recipe(title,instructions,category_id.to_i)

  add_ingredients_to_recipe(new_id)
end


def add_ingredients_to_recipe(recipe_id)
  loop do
    puts 'ADD RECIPE INGREDIENTS'
    puts '----------------------'

    puts "Ingredient name:"
    name = gets.chomp

    puts "Quantity:"
    quantity = gets.to_i

    puts "Unit:"
    Crud.get_all_units.each do |unit|
      puts "#{unit['id']}. #{unit['unit']}"
    end
    unit_id = gets.to_i

    Crud.add_ingredient_to_recipe(quantity,recipe_id,name,unit_id)

    puts 'Do you want to add another ingredient? (y/n)'
    input = gets.chomp
    break if input.downcase == 'n'
  end
end


def menu()
  puts 'Welcome to My Recipe Manager!'
  puts 'Options:'
  puts '---------------------------------'
  puts '1. Add new recipe'
  puts '2. Update recipe'
  puts '3. Delete recipe'
  puts '4. Search recipes'
  puts '5. Select recipe randomly'
  puts '6. See all recipes'
  puts '---------------------------------'
  puts 'Type option number'
  option = gets.chomp
  case option
    when '1'
      add_new_recipe()
    when '2'
      Crud.update_recipe()
    when '3'
      Crud.delete_recipe()
    when '4'
      Crud.search_recipe()
    when '5'
      Crud.ramdom_recipe()
    when '6'
      Crud.see_all_recipe()
    else
      puts 'Invalid option'
  end
end

menu