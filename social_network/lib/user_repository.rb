require 'user'
require 'database_connection'
require 'pg'

class UserRepository

  def all
    sql = "SELECT * FROM user_accounts;"
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |record|
      added_user = assign_to_user(record)
      users << added_user
    end
    return users
  end

  def assign_to_user(record)
    user = User.new
    user.id = record['id'].to_i
    user.username = record['username']
    user.email = record['email']
    return user
  end

  def find(id)
    sql = "SELECT * FROM user_accounts WHERE id = $1;"
    param = [id]
    result_set = DatabaseConnection.exec_params(sql, param)
    result = result_set[0]
    user = assign_to_user(result)
    return user
  end

  def create_user(new_user)
    sql = "INSERT INTO user_accounts (id, username, email) VALUES ($1, $2, $3);"
    params = [new_user.id, new_user.username, new_user.email]

    DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def delete(id)
    sql_post = "DELETE FROM posts WHERE post_id = $1"
    param_post = [id]
    DatabaseConnection.exec_params(sql_post, param_post)

    sql_user = "DELETE FROM user_accounts WHERE id = $1;"
    param_user = [id]
    DatabaseConnection.exec_params(sql_user, param_user)
    return nil
  end
end