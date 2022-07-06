require_relative 'lib/database_connection'

DatabaseConnection.connect('recipes_directory')

sql_query = 'SELECT * FROM recipes;'

result = DatabaseConnection.exec_params(sql_query,[])

result.each do |record|
  p record
end
