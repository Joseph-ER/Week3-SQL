require_relative 'database_connection'
require_relative 'comment'
class CommentRepository


  def all
    sql = "SELECT * FROM comments;"
    result_set = DatabaseConnection.exec_params(sql, [])
    comments = []
    result_set.each do |record|
      new_comment = assign_comment(record)
      comments << new_comment
    end
    return comments
  end

  def assign_comment(record)
    comment = Comment.new
    comment.id = record['id'].to_i
    comment.comment = record['comment']
    comment.commentor = record['commentor']
    comment.comment_id = record['comment_id']
    return comment
  end

  def find_comments(comment_id)
    sql = "SELECT * FROM comments WHERE comment_id = $1;"
    param = [comment_id]

    result_set = DatabaseConnection.exec_params(sql,param)
    comments = []
    result_set.each do |record|
      comment = assign_comment(record)
      comments << comment
    end
    return comments
  end
    
end