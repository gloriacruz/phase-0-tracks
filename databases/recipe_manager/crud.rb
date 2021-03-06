# CRUD stands for Create, Read, Update and Delete from database
require 'sqlite3'

module Crud

  $db = SQLite3::Database.new("recipe_manager.db")
  $db.results_as_hash = true

  def self.add_new_recipe(title, instructions, category_id)
    $db.execute("INSERT INTO recipes (title,instructions,category_id) VALUES (?,?,?)", [title,instructions,category_id])
    return get_last_insert_rowid()
  end

  def self.get_last_insert_rowid()
    rowid = $db.execute("SELECT last_insert_rowid() as id")
    return rowid[0]['id']
  end

  def self.add_ingredient_to_recipe(quantity, recipe_id, name, unit_id)
    # Inserts only new ingredients
    found = false
    ingredient_id = 0
    $db.execute("SELECT * FROM ingredients").each do |ingredient_name|
      if name.downcase == ingredient_name['name'].downcase
        found = true
        # puts "Ingredient found: TRUE"
        ingredient_id = ingredient_name['id']
        break
      end
    end

    if !found
      # puts "Inserting new ingredient"
      $db.execute("INSERT INTO ingredients (name) VALUES (?)", [name])
      ingredient_id = get_last_insert_rowid()
    end

    $db.execute("INSERT INTO recipe_ingredients (quantity,recipe_id,ingredient_id,unit_id) VALUES (?,?,?,?)", [quantity,recipe_id, ingredient_id, unit_id])
  end

  def self.update_recipe(option, recipe_id, value)
    case option
      when '1'
        $db.execute("UPDATE recipes SET title = ? WHERE id = ?", [value, recipe_id])
      when '2'
        $db.execute("UPDATE recipes SET category_id = ? WHERE id = ?", [value, recipe_id])
      when '3'
        $db.execute("UPDATE recipes SET instructions = ? WHERE id = ?", [value, recipe_id])
      when '5'
        $db.execute("DELETE FROM recipe_ingredients WHERE id = ?", [value])
    end
  end

  def self.delete_recipe(recipe_id)
    $db.execute("DELETE FROM recipes WHERE id = ?", [recipe_id])
    $db.execute("DELETE FROM recipe_ingredients WHERE recipe_id = ?", [recipe_id])
  end

  def self.get_all_recipe_ids
    $db.execute("SELECT id FROM recipes")
  end

  def self.get_all_recipes()
    $db.execute("SELECT r.id, r.title, c.name as category FROM recipes r INNER JOIN categories c ON r.category_id = c.id")
  end

  def self.get_recipe_title(recipe_id)
    result = $db.execute("SELECT r.title FROM recipes r WHERE r.id = ?", [recipe_id])
    return result[0]['title']
  end

  def self.get_recipe(recipe_id)
    $db.execute("SELECT r.title, r.instructions, c.name as category FROM recipes r INNER JOIN categories c ON r.category_id = c.id WHERE r.id = ?", [recipe_id])
  end

  def self.get_recipe_ingredients(recipe_id)
    $db.execute("SELECT ri.id, ri.quantity, u.unit, i.name FROM recipe_ingredients ri INNER JOIN ingredients i INNER JOIN units u ON ri.ingredient_id = i.id AND ri.unit_id = u.id WHERE ri.recipe_id = ?", [recipe_id])
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