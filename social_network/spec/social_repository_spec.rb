require 'social_repository'
require 'database_connection'


def reset_social_table
  seed_sql = File.read('seeds_social_network.sql')
  connection = PG.connect({host: '127.0.0.1', dbname: 'social_network'})
  connection.exec_params(seed_sql)
end

describe SocialRepository do
  before(:each) do
    reset_social_table
  end

  context "Rspec tests" do

    it " " do
      
    end







  end
end