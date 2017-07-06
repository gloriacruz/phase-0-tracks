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

  def self.delete_recipe(recipe_id)
    $db.execute("DELETE FROM recipes WHERE id = ?", [recipe_id])
    $db.execute("DELETE FROM recipe_ingredients WHERE recipe_id = ?", [recipe_id])
  end

  def self.random_recipe()
    puts 'Random recipe feature coming soon...'
  end

  def self.get_all_recipe_ids
    $db.execute("SELECT id FROM recipes")
  end

  def self.get_all_recipes()
    $db.execute("SELECT r.id, r.title, c.name as category FROM recipes r INNER JOIN categories c ON r.category_id = c.id")
  end

  def self.get_recipe(recipe_id)
    $db.execute("SELECT r.title, r.instructions, c.name as category FROM recipes r INNER JOIN categories c ON r.category_id = c.id WHERE r.id = ?", [recipe_id])
  end

  def self.get_recipe_ingredients(recipe_id)
    $db.execute("SELECT ri.quantity, u.unit, i.name FROM recipe_ingredients ri INNER JOIN ingredients i INNER JOIN units u ON ri.ingredient_id = i.id AND ri.unit_id = u.id WHERE ri.recipe_id = ?", [recipe_id])
  end

  def self.search_by_title(keywords)
    $db.execute("SELECT r.id, r.title, c.name as category FROM recipes r INNER JOIN categories c ON r.category_id = c.id WHERE r.title LIKE '%' || ? || '%'", [keywords])
  end

  def self.search_by_category(category_id)
    $db.execute("SELECT r.id, r.title, c.name as category FROM recipes r INNER JOIN categories c ON r.category_id = c.id WHERE c.id = ?", [category_id])
  end

  def self.search_by_ingredient(keywords)
    $db.execute("SELECT r.id, r.title, i.name as ingredient FROM recipes r INNER JOIN recipe_ingredients ri INNER JOIN ingredients i ON r.id = ri.recipe_id AND ri.ingredient_id = i.id WHERE i.name LIKE '%' || ? || '%'", [keywords])
  end

  def self.get_all_categories()
    $db.execute("SELECT * FROM categories")
  end

  def self.get_all_units()
    $db.execute("SELECT * FROM units")
  end
end