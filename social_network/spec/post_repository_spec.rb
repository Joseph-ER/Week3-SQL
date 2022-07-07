require 'post_repository'
require 'database_connection'
require 'post'


def reset_social_table
  seed_sql = File.read('spec/seeds_social_network.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'social_network_test'})
  connection.exec_params(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_social_table
  end

  context "Rspec tests" do

    it "all_method# returns all posts" do

      repo = PostRepository.new

      posts= repo.all

      expect(posts.length).to eq(4)
      expect(posts[0].title).to eq("Joseph first post!")
      expect(posts[0].id).to eq(1)
      expect(posts[0].post_id).to eq(1)

    end

    it "find# method returns only matching id posts " do
      repo = PostRepository.new

      post = repo.find(1)

      expect(post.title).to eq("Joseph first post!")
      expect(post.id).to eq(1)
      expect(post.post_id).to eq(1)

    end


    it "create# method adds new post from Joseph " do
      repo = PostRepository.new

      new_post = Post.new
      new_post.id = 5
      new_post.title = "New post!"
      new_post.content = "This is some new content!"
      new_post.post_id = 1

      expect { repo.create(new_post) }.not_to raise_error
      posts = repo.all

      expect(posts.last.id).to eq(5)
      expect(posts.last.title).to eq("New post!")
      expect(posts.last.content).to eq("This is some new content!")
      expect(posts.last.post_id).to eq(1)
    end

    it "delete# method removes a post by the id " do
      repo = PostRepository.new

      expect { repo.delete(1) }.not_to raise_error
      posts = repo.all
      expect(posts.length).to eq(3)
      expect(posts.last.title).to eq("Joe post now")
      expect(posts.last.id).to eq(4)

    end
  end
end