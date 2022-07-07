require 'user_repository'
require 'database_connection'
require 'user'

def reset_social_table
  seed_sql = File.read('spec/seeds_social_network.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'social_network_test'})
  connection.exec_params(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_social_table
  end

  describe "Rspec Tests " do

    it "all# method returns all users " do
      repo = UserRepository.new
      users = repo.all
      expect(users.length).to eq(3)
      expect(users[0].id).to eq(1)
      expect(users[0].username).to eq("Joseph")
      expect(users[0].email).to eq("joseph@mail.com")
    end

    it "find# method returns user with id == 1 " do
      repo = UserRepository.new

      expect {repo.find(1) }.not_to raise_error
      expect(repo.find(1).username).to eq("Joseph")
      expect(repo.find(1).email).to eq("joseph@mail.com")
    end


    it "create_user# method adds new user " do
      repo = UserRepository.new
      user = User.new
      user.id = 4
      user.username = "Daniel"
      user.email = "daniel@mail.com"

      expect { repo.create_user(user) }.not_to raise_error
      users = repo.all
      expect(users.length).to eq(4)
      expect(users.last.username).to eq("Daniel")
      expect(users.last.email).to eq("daniel@mail.com")

    end

    it "delete# method removes a user by their id matching 1 " do
      repo = UserRepository.new

      expect { repo.delete(1) }.not_to raise_error
      users = repo.all
      expect(users.length).to eq(2)
      expect(users.first.username).to eq("Colin")
      expect(users.last.username).to eq("Joe")

    end
  end
end