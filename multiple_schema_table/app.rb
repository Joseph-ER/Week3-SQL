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
     post_repo =PostRepository.new
     comment_repo = CommentRepository.new
     found_post = post_repo.find_with_comments(3)
     @io.puts "Post- #{found_post.title} - #{found_post.content}"
     @io.puts "Comments-"
     found_post.comments.each do |comment|
      @io.puts "#{comment.comment}- #{comment.commentor}"
     end

  end
end

app = Application.new(
  'blog',
  Kernel,
  PostRepository.new,
  CommentRepository.new
)
app.run