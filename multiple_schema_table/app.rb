require_relative 'lib/post_repository.rb'
require_relative 'lib/comment_repository.rb'



class Application

  def initialize(database_name, io, comment_repository, post_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @comment_repository = comment_repository
    @post_repository = post_repository
  end
  def run
    # post_repo =PostRepository.new
    # comment_repo = CommentRepository.new
    # post_repo.find_posts
  end
end