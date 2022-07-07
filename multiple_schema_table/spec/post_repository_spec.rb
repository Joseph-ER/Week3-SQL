require 'post'
require 'post_repository'
require 'comment'
require 'database_connection'

def reset_blog_tables

  seed_sql = File.read('spec/seeds_blog.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'blog'})
  connection.exec_params(seed_sql)
end

describe PostRepository do
  before(:each)do
    reset_blog_tables
  end

  describe "single table  all# tests" do

    it "all posts method" do
      repo = PostRepository.new
      posts = repo.all
      expect(posts.length).to eq(3)
      expect(posts[0].title).to eq("First post!")
    end

    it "find_posts method " do
      repo = PostRepository.new
      posts = repo.find_posts(1)
      expect(posts.length).to eq(1)
      expect(posts.first.title).to eq("First post!")
    end

  end

  describe "join table tests" do

    it "post_and_comments# method returns post and the conencted comments " do
      repo = PostRepository.new
      post = repo.find_with_comments(1)

      expect(post.title).to eq("First post!")
      expect(post.comments.length).to eq(1)
    end

  end
end
