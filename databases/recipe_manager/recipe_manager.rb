require_relative 'crud'

# This function allows the user to add a recipe to the database. It displays the final recipe.
# Input: none
# Output: none
def add_new_recipe
  clear_screen
  puts 'ADD NEW RECIPE'
  puts '--------------'

  print ">>Title of the recipe: "
  title = gets.chomp

  category_id = select_category

  print ">>Enter the instructions: "
  instructions = gets.chomp

  new_id = Crud.add_new_recipe(title,instructions,category_id)

  add_ingredients_to_recipe(new_id)

  display_recipe(new_id)
end

# This function allows the user to add ingredients to a specified recipe in the database.
# Input: recipe id
# Output: none
def add_ingredients_to_recipe(recipe_id)
  loop do
    clear_screen
    puts 'ADD RECIPE INGREDIENTS'
    puts '----------------------'

    print ">>Ingredient name: "
    name = gets.chomp

    print ">>Quantity: "
    quantity = gets.to_f

    unit_id = select_unit

    Crud.add_ingredient_to_recipe(quantity,recipe_id,name,unit_id)

    print '>>Do you want to add another ingredient? (y/n) '
    input = gets.chomp
    break if input.downcase == 'n'
  end
end

# This funtion allows the user to select a category from a list of available categories.
# Input: none
# Output: the selected category id
def select_category
  puts ""
  puts "Categories:"
  puts "-----------"
  # Crud.get_all_categories.each do |category|
  #   puts "#{category['id']}. #{category['name']}"
  # end
  category_id_array = []
  categories = Crud.get_all_categories
  i = 0
  while i < categories.length
    if i+1 < categories.length
      printf "%-3s %-20s %-3s %s\n", categories[i]['id'].to_s+".", categories[i]['name'], categories[i+1]['id'].to_s+".", categories[i+1]['name']
      category_id_array << categories[i]['id']
      category_id_array << categories[i+1]['id']
    else
      printf "%-3s %-20s\n", categories[i]['id'].to_s+".", categories[i]['name']
      category_id_array << categories[i]['id']
    end
    i = i + 2
  end

  category_id = 0
  loop do
    print ">>Select a category: "
    category_id = gets.chomp.to_i
    if category_id <= 0 || !category_id_array.include?(category_id)
      puts '>>Invalid option!'
    else
      break
    end
  end

  return category_id
end

# This funtion allows the user to select an unit from a list of available units.
# Input: none
# Output: the selected unit id
def select_unit
  puts ""
  puts "Units:"
  puts "------"
  # Crud.get_all_units.each do |unit|
  #   puts "#{unit['id']}. #{unit['unit']}"
  # end
  unit_id_array = []
  units = Crud.get_all_units
  i = 0
  while i < units.length
    if i+1 < units.length
      printf "%-3s %-20s %-3s %s\n", units[i]['id'].to_s+".", units[i]['unit'], units[i+1]['id'].to_s+".", units[i+1]['unit']
      unit_id_array << units[i]['id']
      unit_id_array << units[i+1]['id']
    else
      printf "%-3s %-20s\n", units[i]['id'].to_s+".", units[i]['unit']
      unit_id_array << units[i]['id']
    end
    i = i + 2
  end

  unit_id = 0
  loop do
    print ">>Select a unit of measure: "
    unit_id = gets.chomp.to_i
    if unit_id <= 0 || !unit_id_array.include?(unit_id)
      puts '>>Invalid option!'
    else
      break
    end
  end

  return unit_id
end

# This function allow the user to select and delete a recipe.
# Input: none
# Output: none
def delete_recipe
  clear_screen
  puts 'DELETE RECIPE'
  puts '-------------'
  puts "Recipes:"
  puts '--------'
  recipe_id_array = []
  Crud.get_all_recipes.each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
    recipe_id_array << recipe['id']
  end

  recipe_id = select_recipe(recipe_id_array)
  if recipe_id > 0
    Crud.delete_recipe(recipe_id)
    puts '>>The recipe has been deleted!'
    print '>>Press any key to continue...'
    key = gets.chomp
  end
end

# This function display all recipes in the database, calls select_recipe and display_recipe functions to make up the See all recipe feature
# Input: none
# Output: none
def display_all_recipe
  clear_screen
  puts 'RECIPE CATALOG'
  puts '--------------'
  recipe_id_array = []
  Crud.get_all_recipes.each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
    recipe_id_array << recipe['id']
  end

  recipe_id = select_recipe(recipe_id_array)

  display_recipe(recipe_id)
end

# This function is in charge of displaying a specified recipe on screen
# Input: recipe id
# Output: none
def display_recipe(recipe_id)
  return if recipe_id <= 0
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

# This funtion allows the user to select a recipe from a list of valid recipes.
# Input: array with valid recipes ids
# Output: the selected recipe id
def select_recipe(valid_recipe_ids)
  recipe_id = 0
  loop do
    print '>>Select a recipe. Type the recipe number or CANCEL to quit: '
    input = gets.chomp
    if input.downcase != 'cancel'
      recipe_id = input.to_i
      if recipe_id <= 0 || !valid_recipe_ids.include?(recipe_id)
        puts '>>Invalid option!'
      else
        break
      end
    else
      recipe_id = 0
      break
    end
  end
  return recipe_id
end

# This funtion provides the search recipe feature and search sub-menu. Displays the recipe after selectiom.
# Input: none
# Output: none
def search_recipe
  clear_screen
  puts 'SEARCH RECIPE'
  puts '-------------'
  puts 'Options:'
  puts '--------'
  puts '1. Search by title'
  puts '2. Search by category'
  puts '3. Search by ingredient'
  puts '4. CANCEL'
  print ">>Select one option. Type option number: "
  option = gets.chomp
  recipes = []
  case option
    when '1'
      recipes = search_recipes_by_title
    when '2'
      recipes = search_recipes_by_category
    when '3'
      recipes = search_recipes_by_ingredient
    when '4'
    else
      puts '>>Invalid option!'
      sleep(0.7)
  end
  if recipes.length > 0
    recipe_id = select_recipe(recipes)
    display_recipe(recipe_id)
  end
end

# This funtion searches and displays recipes based on title keywords provided by the user.
# Input: none
# Output: an array of the recipes ids included in the search results
def search_recipes_by_title
  print ">>Type title keywords: "
  input = gets.chomp
  puts ""
  puts "MATCH RESULTS:"
  puts "--------------"
  valid_recipe_ids = []
  Crud.search_by_title(input).each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
    valid_recipe_ids << recipe['id']
  end
  if valid_recipe_ids.length == 0
    puts "No results found"
    puts ""
    print '>>Press any key to continue...'
    key = gets.chomp
  end
  return valid_recipe_ids
end

# This funtion searches and displays recipes based on a recipe category selected by the user.
# Input: none
# Output: an array of the recipes ids included in the search results
def search_recipes_by_category
  category_id = select_category
  puts ""
  puts "MATCH RESULTS:"
  puts "--------------"
  valid_recipe_ids = []
  Crud.search_by_category(category_id).each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
    valid_recipe_ids << recipe['id']
  end
  if valid_recipe_ids.length == 0
    puts "No results found"
    puts ""
    print '>>Press any key to continue...'
    key = gets.chomp
  end
  return valid_recipe_ids
end

# This funtion searches and displays recipes based on ingredient keywords provided by the user.
# Input: none
# Output: an array of the recipes ids included in the search results
def search_recipes_by_ingredient
  print ">>Type ingredient keyword: "
  input = gets.chomp
  puts ""
  puts "MATCH RESULTS:"
  puts "--------------"
  valid_recipe_ids = []
  Crud.search_by_ingredient(input).each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + "   contains... " + recipe['ingredient'].capitalize
    valid_recipe_ids << recipe['id']
  end
  if valid_recipe_ids.length == 0
    puts "No results found"
    puts ""
    print '>>Press any key to continue...'
    key = gets.chomp
  end
  return valid_recipe_ids
end

# This funtion selects and displays a random recipe.
# Input: none
# Output: none
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

# This funtion clears the screen for better visualization.
# Input: none
# Output: none
def clear_screen
  if RUBY_PLATFORM =~ /win32|win64|\.NET|windows|cygwin|mingw32/i
    system('cls')
  else
    system('clear')
  end
end

# This funtion allows the user to select an ingredient from a list of ingredients in the specified recipe.
# Input: recipe id
# Output: the selected ingredient id
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

# This funtion provides the edit recipe feature and edit sub-menu. Displays the recipe after changes.
# Input: none
# Output: none
def edit_recipe
  clear_screen
  puts 'EDIT RECIPE'
  puts '-----------'
  puts "Recipes:"
  puts '--------'
  recipe_id_array = []
  Crud.get_all_recipes.each do |recipe|
    puts "#{recipe['id']}. " + recipe['title'].capitalize + " [ #{recipe['category']} ]"
    recipe_id_array << recipe['id']
  end
  recipe_id = select_recipe(recipe_id_array)

  if recipe_id > 0
    clear_screen
    puts 'EDIT RECIPE ' + Crud.get_recipe_title(recipe_id).to_s
    puts '--------------------------'
    puts 'Options:'
    puts '--------'
    puts '1. Edit title'
    puts '2. Edit category'
    puts '3. Edit instructions'
    puts '4. Add ingredients'
    puts '5. Remove ingredient'
    puts '6. CANCEL'
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
      when '6'
      else
        puts '>>Invalid option!'
        sleep(0.7)
    end
    display_recipe(recipe_id) if option != '6'
  end
end

# Main options menu.
# Input: none
# Output: none
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
        sleep(0.7)
    end
  end
end

menu