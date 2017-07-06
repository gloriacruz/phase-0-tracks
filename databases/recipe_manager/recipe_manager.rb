require_relative 'crud'

def add_new_recipe
  clear_screen
  puts 'ADD NEW RECIPE'
  puts '--------------'

  print ">>Title of the recipe: "
  title = gets.chomp

  category_id = select_category

  print ">>Enter the instructions: "
  instructions = gets.chomp

  new_id = Crud.add_new_recipe(title,instructions,category_id.to_i)

  add_ingredients_to_recipe(new_id)

  display_recipe(new_id)
end

def add_ingredients_to_recipe(recipe_id)
  loop do
    clear_screen
    puts 'ADD RECIPE INGREDIENTS'
    puts '----------------------'

    print ">>Ingredient name: "
    name = gets.chomp

    print ">>Quantity: "
    quantity = gets.to_i

    unit_id = select_unit

    Crud.add_ingredient_to_recipe(quantity,recipe_id,name,unit_id)

    print '>>Do you want to add another ingredient? (y/n) '
    input = gets.chomp
    break if input.downcase == 'n'
  end
end

def select_category
  puts ""
  puts "Categories:"
  puts "-----------"
  # Crud.get_all_categories.each do |category|
  #   puts "#{category['id']}. #{category['name']}"
  # end
  categories_array = Crud.get_all_categories
  i = 0
  while i < categories_array.length
    if i+1 < categories_array.length
      printf "%-3s %-20s %-3s %s\n", categories_array[i]['id'].to_s+".", categories_array[i]['name'], categories_array[i+1]['id'].to_s+".", categories_array[i+1]['name']
    else
      printf "%-3s %-20s\n", categories_array[i]['id'].to_s+".", categories_array[i]['name']
    end
    i = i + 2
  end
  print ">>Select a category: "
  category_id = gets.chomp
  return category_id
end

def select_unit
  puts ""
  puts "Units:"
  puts "------"
  # Crud.get_all_units.each do |unit|
  #   puts "#{unit['id']}. #{unit['unit']}"
  # end
  units_array = Crud.get_all_units
  i = 0
  while i < units_array.length
    if i+1 < units_array.length
      printf "%-3s %-20s %-3s %s\n", units_array[i]['id'].to_s+".", units_array[i]['unit'], units_array[i+1]['id'].to_s+".", units_array[i+1]['unit']
    else
      printf "%-3s %-20s\n", units_array[i]['id'].to_s+".", units_array[i]['unit']
    end
    i = i + 2
  end

  print ">>Select a unit of measure: "
  unit_id = gets.to_i
  return unit_id
end

def delete_recipe
    clear_screen
    puts 'DELETE RECIPE'
    puts '-------------'
    puts "Recipes:"
    puts '--------'
    Crud.get_all_recipes.each do |recipe|
      puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
    end
    print '>>Select a recipe to delete. Type the recipe number: '
    recipe_id = gets.chomp
    Crud.delete_recipe(recipe_id)
    puts '>>The recipe has been deleted!'
    print '>>Press any key to continue...'
    key = gets.chomp
end

def display_all_recipe
  clear_screen
  puts 'RECIPE CATALOG'
  puts '--------------'
  Crud.get_all_recipes.each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
  end
  print '>>Select a recipe to display. Type the recipe number: '
  recipe_id = gets.chomp
  display_recipe(recipe_id)
end

def display_recipe(recipe_id)
  clear_screen
  recipe = Crud.get_recipe(recipe_id)[0]
  puts "RECIPE " + recipe['title'].capitalize
  puts '-------------------------'
  puts "CATEGORY: #{recipe['category']}"
  puts 'INGREDIENTS:'
  Crud.get_recipe_ingredients(recipe_id).each do |ingredient|
    puts "* #{ingredient['quantity']} #{ingredient['unit']} of " + ingredient['name'].capitalize
  end
  puts "INSTRUCTIONS: "
  puts recipe['instructions'].capitalize
  print '>>Press any key to continue...'
  key = gets.chomp
end

def search_recipe
  clear_screen
  puts 'SEARCH RECIPE'
  puts '-------------'
  puts 'Options:'
  puts '--------'
  puts '1. Search by title'
  puts '2. Search by category'
  puts '3. Search by ingredient'
  print ">>Select one option. Type option number: "
  option = gets.chomp
  case option
    when '1'
      search_by_title
    when '2'
      search_by_category
    when '3'
      search_by_ingredient
    else
      puts '>>Invalid option!'
  end
end

def search_by_title
  print ">>Type title keywords: "
  input = gets.chomp
  puts ""
  puts "MATCH RESULTS:"
  puts "--------------"
  Crud.search_by_title(input).each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
  end
  print '>>Select a recipe to display. Type the recipe number: '
  recipe_id = gets.chomp
  display_recipe(recipe_id)
end

def search_by_category
  category_id = select_category
  puts ""
  puts "MATCH RESULTS:"
  puts "--------------"
  Crud.search_by_category(category_id).each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
  end
  print '>>Select a recipe to display. Type the recipe number: '
  recipe_id = gets.chomp
  display_recipe(recipe_id)
end

def search_by_ingredient
  print ">>Type ingredient keyword: "
  input = gets.chomp
  puts ""
  puts "MATCH RESULTS:"
  puts "--------------"
  Crud.search_by_ingredient(input).each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + "   contains... " + recipe['ingredient'].capitalize
  end
  print '>>Select a recipe to display. Type the recipe number: '
  recipe_id = gets.chomp
  display_recipe(recipe_id)
end

def select_random_recipe
  clear_screen
  puts 'RANDOM RECIPE SELECTOR'
  puts '----------------------'
  6.times do |x|
    puts "#{x}..."
    sleep(0.3)
  end
  display_recipe(Crud.get_all_recipe_ids.sample['id'])
end

def clear_screen
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
end

def select_ingredient(recipe_id)
  puts ""
  puts "Ingredients:"
  puts '------------'
  Crud.get_recipe_ingredients(recipe_id).each do |ingredient|
    puts "#{ingredient['id']}. #{ingredient['quantity']} #{ingredient['unit']} of " + ingredient['name'].capitalize
  end
  print '>>Select an ingredient to delete. Type the ingredient number: '
  ingredient_id = gets.chomp
end

def edit_recipe
  clear_screen
  puts 'EDIT RECIPE'
  puts '-----------'
  puts "Recipes:"
  puts '--------'
  Crud.get_all_recipes.each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
  end
  print '>>Select a recipe to edit. Type the recipe number: '
  recipe_id = gets.chomp

  clear_screen
  puts 'EDIT RECIPE'
  puts '-----------'
  puts 'Options:'
  puts '--------'
  puts '1. Edit title'
  puts '2. Edit category'
  puts '3. Edit instructions'
  puts '4. Add ingredients'
  puts '5. Remove ingredient'
  print ">>Select one option. Type option number: "
  option = gets.chomp
  case option
    when '1'
      print ">>Enter new title: "
      title = gets.chomp
      Crud.update_recipe(option, recipe_id, title)
    when '2'
      category_id = select_category
      Crud.update_recipe(option, recipe_id, category_id)
    when '3'
      print ">>Enter new instructions: "
      instructions = gets.chomp
      Crud.update_recipe(option, recipe_id, instructions)
    when '4'
      add_ingredients_to_recipe(recipe_id)
    when '5'
      ingredient_id = select_ingredient(recipe_id)
      Crud.update_recipe(option, recipe_id, ingredient_id)
    else
      puts '>>Invalid option!'
  end
  display_recipe(recipe_id)
end

def menu()
  loop do
    clear_screen
    puts 'Welcome to My Recipe Manager!'
    puts 'Options:'
    puts '---------------------------------'
    puts '1. Add new recipe'
    puts '2. Update recipe'
    puts '3. Delete recipe'
    puts '4. Search recipe'
    puts '5. Select random recipe'
    puts '6. See recipe list'
    puts '7. EXIT'
    puts '---------------------------------'
    print '>>Type option number: '
    option = gets.chomp
    case option
      when '1'
        add_new_recipe
      when '2'
        edit_recipe
      when '3'
        delete_recipe
      when '4'
        search_recipe
      when '5'
        select_random_recipe
      when '6'
        display_all_recipe
      when '7'
        break
      else
        puts '>>Invalid option!'
    end
  end
end

menu