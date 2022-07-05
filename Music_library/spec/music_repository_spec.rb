require 'database_connection'
require 'music_repository'

def reset_artist_table
  seed_sql = File.read('spec/seeds_music_library.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec(seed_sql)
end

describe MusicRepository do
  before(:each) do 
    reset_artist_table
  end

  it "SQL query to search and display all artists " do
    repo = MusicRepository.new

    artists = repo.all

    expect(artists.length).to eq 2

    expect(artists[0].id).to eq (1)
    expect(artists[0].name).to eq ('Pixies')
    expect(artists[0].genre).to eq ('Rock')

    expect(artists[1].id).to eq (2)
    expect(artists[1].name).to eq ('ABBA')
    expect(artists[1].genre).to eq ('Pop')

  end
end