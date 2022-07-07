require_relative 'database_connection'
require 'post'
require 'pg'

class PostRepository
  
  def all
    sql = 'SELECT * FROM posts;'
    result_set = DatabaseConnection.exec_params(sql,[])

    all_posts = []

    result_set.each do |record|
      added_post = assign_to_post(record)
      all_posts << added_post
    end
    return all_posts

  end

  def assign_to_post(record)
    post = Post.new
    post.id = record['id'].to_i
    post.title = record['title']
    post.content = record['content']
    post.post_id = record['post_id'].to_i
    return post
  end

  def find(id)
    sql = "SELECT * FROM posts WHERE id = $1"
    param = [id]

    result = DatabaseConnection.exec_params(sql, param)

    post = assign_to_post(result[0])
    return post
  end

  def create(new_post)
    sql = "INSERT INTO posts (id, title, content, post_id) VALUES ( $1, $2, $3, $4);"
    params = [new_post.id, new_post.title, new_post.content, new_post.post_id]
    result = DatabaseConnection.exec_params(sql, params)
    return nil
  end

  def delete(id)
    sql = "DELETE FROM posts WHERE id = $1"
    param = [id]

    DatabaseConnection.exec_params(sql, param)
    return nil
  end
end