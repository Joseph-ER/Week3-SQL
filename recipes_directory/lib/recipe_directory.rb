require 'database_connection'

class RecipeRepository

  # Selecting all records
  # No arguments
  def all
    # Executes the SQL query:
    # SELECT id, name, genre FROM artists;
    sql_query = 'SELECT * FROM recipes'
    result_set = DatabaseConnection.exec_params(sql_query, [])

    recipes_list = []
    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id'].to_i
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time'].to_i
      recipe.rating = record['rating'].to_i
      recipes_list << recipe
    end
    return recipes_list

    # Returns an array of Artist objects.
  end

  # Gets a single record by its ID
  # One argument: the id (number)
  def find(rating)
    # Executes the SQL query:
    # SELECT id, name, cohort_name FROM students WHERE id = $1;
    sql_query = 'SELECT * FROM recipes WHERE rating = $1'
    param = [rating]

    recipes_list = []
    result_set = DatabaseConnection.exec_params(sql_query,param)

    result_set.each do |record|
      recipe = Recipe.new
      recipe.id = record['id'].to_i
      recipe.name = record['name']
      recipe.cooking_time = record['cooking_time'].to_i
      recipe.rating = record['rating'].to_i
      recipes_list << recipe
    end
    return recipes_list
    # Returns a single Student object.
  end
end