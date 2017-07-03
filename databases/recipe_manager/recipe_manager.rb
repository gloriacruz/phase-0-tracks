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
  Crud.add_new_recipe(title,instructions,category_id.to_i)
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