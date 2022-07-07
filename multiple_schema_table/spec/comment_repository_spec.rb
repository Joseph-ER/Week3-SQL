require 'comment_repository'
require 'comment'

def reset_blog_tables

  seed_sql = File.read('spec/seeds_blog.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'blog'})
  connection.exec_params(seed_sql)
end

describe CommentRepository do
  before(:each)do
    reset_blog_tables
  end

  it "all test" do
    repo = CommentRepository.new
    comment = repo.all
    expect(comment.length).to eq(5)
    expect(comment[0].comment).to eq("Nice work Joe")
  end

  it "find where comment_id = 3" do

    repo = CommentRepository.new
    comments = repo.find_comments(3)
    expect(comments.length).to eq(3)
    expect(comments.first.comment).to eq("Great one Dan")
  end
    






end