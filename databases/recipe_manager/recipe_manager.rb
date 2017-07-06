require_relative 'crud'

def add_new_recipe
  puts 'ADD NEW RECIPE'
  puts '--------------'

  puts "Title of the recipe:"
  title = gets.chomp

  puts "Enter the instructions:"
  instructions = gets.chomp

  puts "Categories:"
  Crud.get_all_categories.each do |category|
    puts "#{category['id']}. #{category['name']}"
  end
  puts "Select a category:"
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

    puts "Units:"
    Crud.get_all_units.each do |unit|
      puts "#{unit['id']}. #{unit['unit']}"
    end
    puts "Select a unit of measure:"
    unit_id = gets.to_i

    Crud.add_ingredient_to_recipe(quantity,recipe_id,name,unit_id)

    puts 'Do you want to add another ingredient? (y/n)'
    input = gets.chomp
    break if input.downcase == 'n'
  end
end

def delete_recipe
    puts 'DELETE RECIPE'
    puts '-------------'

    puts "Recipes:"
    Crud.get_all_recipes.each do |recipe|
      puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
    end
    puts 'Select a recipe to delete. Type the recipe number:'
    recipe_id = gets.chomp
    Crud.delete_recipe(recipe_id)
    puts 'The recipe has been deleted!'
end

def display_all_recipe
  puts 'RECIPE CATALOG'
  puts '--------------'

  Crud.get_all_recipes.each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
  end
  puts 'Select a recipe to display. Type the recipe number:'
  recipe_id = gets.chomp
  display_recipe(recipe_id)
end

def display_recipe(recipe_id)
  recipe = Crud.get_recipe(recipe_id)[0]
  puts "RECIPE " + recipe['title'].capitalize
  puts '-------------------------'
  puts "CATEGORY: #{recipe['category']}"
  puts 'INGREDIENTS:'
  Crud.get_recipe_ingredients(recipe_id).each do |ingredient|
    puts "* #{ingredient['quantity']} #{ingredient['unit']} of " + ingredient['name'].capitalize
  end
  puts "INSTRUCTIONS: " + recipe['instructions'].capitalize
end

def search_recipe
  puts 'SEARCH RECIPE'
  puts '-------------'
  puts 'Options:'
  puts '1. Search by title'
  puts '2. Search by category'
  puts '3. Search by ingredient'
  puts "Select one option. Type option number:"
  option = gets.chomp
  case option
    when 1
      search_by_title
    when 2
      search_by_category
    when 3
      search_by_ingredient
    else
      puts 'Invalid option'
  end
end

def search_by_title

end

def search_by_category

end

def search_by_ingredient

end

def menu()
  puts 'Welcome to My Recipe Manager!'
  puts 'Options:'
  puts '---------------------------------'
  puts '1. Add new recipe'
  puts '2. Update recipe'
  puts '3. Delete recipe'
  puts '4. Search recipe'
  puts '5. Select recipe randomly'
  puts '6. See recipe list'
  puts '---------------------------------'
  puts 'Type option number'
  option = gets.chomp
  case option
    when '1'
      add_new_recipe
    when '2'
      Crud.update_recipe()
    when '3'
      delete_recipe
    when '4'
      search_recipe
    when '5'
      Crud.ramdom_recipe()
    when '6'
      display_all_recipe
    else
      puts 'Invalid option'
  end
end

menu