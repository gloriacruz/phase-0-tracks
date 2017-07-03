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
end