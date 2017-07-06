# CRUD stands for Create, Read, Update and Delete from database
require 'sqlite3'

module Crud

  $db = SQLite3::Database.new("recipe_manager.db")
  $db.results_as_hash = true

  def self.add_new_recipe(title, instructions, category_id)
    # Creates a recipes table if the program is running for the first time
    create_table_cmd =<<-SQL
      CREATE TABLE IF NOT EXISTS recipes(
        id INTEGER PRIMARY KEY,
        title VARCHAR(255),
        instructions text,
        category_id INTEGER,
        FOREIGN KEY (category_id) REFERENCES categories(id)
      )
    SQL
    $db.execute(create_table_cmd)

    $db.execute("INSERT INTO recipes (title,instructions,category_id) VALUES (?,?,?)", [title,instructions,category_id])
    return get_last_insert_rowid()
  end

  def self.get_last_insert_rowid()
    rowid = $db.execute("SELECT last_insert_rowid() as id")
    # p rowid
    # p rowid[0]
    # p rowid[0]['id']
    return rowid[0]['id']
  end

  def self.add_ingredient_to_recipe(quantity, recipe_id, name, unit_id)
    # Inserts only new ingredients
    found = false
    ingredient_id = 0
    $db.execute("SELECT * FROM ingredients").each do |ingredient_name|
      # p ingredient_name
      # p name.downcase
      if name.downcase == ingredient_name['name'].downcase
        found = true
        puts "Ingredient found: TRUE" #DEBUG
        ingredient_id = ingredient_name['id']
        # p insert_id
        break
      end
    end

    if !found
      puts "Inserting new ingredient" #DEBUG
      $db.execute("INSERT INTO ingredients (name) VALUES (?)", [name])
      ingredient_id = get_last_insert_rowid()
    end

    $db.execute("INSERT INTO recipe_ingredients (quantity,recipe_id,ingredient_id,unit_id) VALUES (?,?,?,?)", [quantity,recipe_id, ingredient_id, unit_id])
  end

  def self.update_recipe()
    puts 'Update recipe feature coming soon...'
  end

  def self.delete_recipe()
    puts 'Delete recipe feature coming soon...'
  end

  def self.search_recipe()
    puts 'Search recipe feature coming soon...'
  end

  def self.ramdom_recipe()
    puts 'Ramdom recipe feature coming soon...'
  end

  def self.see_all_recipe()
    puts 'See all recipes feature coming soon...'
  end

  def self.get_all_categories()
    $db.execute("SELECT * FROM categories")
  end

  def self.get_all_units()
    $db.execute("SELECT * FROM units")
  end
end