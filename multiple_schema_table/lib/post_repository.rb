require_relative 'database_connection'
require_relative 'post'
require_relative 'comment'
require 'pg'

class PostRepository

  def all
    sql = "SELECT * FROM posts;"
    result_set = DatabaseConnection.exec_params(sql, [])
    posts = []
    result_set.each do |record|
      new_post = assign_post(record)
      posts << new_post
    end
    return posts
  end

  def assign_post(record)
    post = Post.new
    post.id = record['id'].to_i
    post.title = record['title']
    post.content = record['content']
    return post
  end

  def find_posts(id)
    sql = "SELECT * FROM posts WHERE id = $1;"
    param = [id]

    result_set = DatabaseConnection.exec_params(sql,param)
    posts = []
    result_set.each do |record|
      post = assign_post(record)
      posts << post
    end
    return posts
  end

  def find_with_comments(id)
    sql = "SELECT posts.id, posts.title, comments.comment, comments.commentor
    FROM posts JOIN comments ON posts.id = comments.comment_id
    WHERE posts.id = $1;"
    params = [id]

    result = DatabaseConnection.exec_params(sql,params)
    post = Post.new
    post.id = result.first['id'].to_i
    post.title = result.first['title']
    post.content = result.first['content']
    

    result.each do |record|
      comment = Comment.new
      comment.id = record['id'].to_i
      comment.comment = record['comment']
      comment.commentor = record['commentor']
      comment.comment_id = record['comment_id'].to_i

      post.comments << comment
    end
    return post
  end
end