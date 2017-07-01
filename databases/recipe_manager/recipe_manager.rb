require_relative 'crud'

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
      Crud.add_new_recipe()
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