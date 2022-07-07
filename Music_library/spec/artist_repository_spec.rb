require 'database_connection'
require 'artist_repository'
require 'album'

def reset_artist_table
  seed_sql = File.read('spec/seeds_music_library.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'music_library_test' })
  connection.exec_params(seed_sql)
end

describe ArtistRepository do
  before(:each) do 
    reset_artist_table
  end

  it "SQL query to search and display all artists " do
    repo = ArtistRepository.new

    artists = repo.all

    expect(artists.length).to eq 4

    expect(artists[0].id).to eq (1)
    expect(artists[0].name).to eq ('Pixies')
    expect(artists[0].genre).to eq ('Rock')

    expect(artists[1].id).to eq (2)
    expect(artists[1].name).to eq ('ABBA')
    expect(artists[1].genre).to eq ('Pop')

  end

  it "SQL find method " do
    repo = ArtistRepository.new

    artist = repo.find(1)

    expect(artist.id).to eq(1)
    expect(artist.name).to eq('Pixies')
    expect(artist.genre).to eq('Rock')
  end

  it "create method adds new album" do

    repo = ArtistRepository.new
    new_album = Album.new
    new_album.title = 'Trompe le Monde'
    new_album.release_year = 1991
    new_album.artist_id = 1

    repo.create(new_album)

    all_albums = repo.albums_all

    expect(all_albums).to include(have_attributes(title: new_album.title, release_year: '1991', artist_id: '1'))

  end

  it "all albums method" do

    repo = ArtistRepository.new

    all_albums = repo.albums_all

    expect(all_albums.length).to eq(12)
    

  end

  it "create artist method adds a new artist " do
    repo = ArtistRepository.new

    artist = Artist.new
    artist.name = 'Tom Waits'
    artist.genre = 'Rock'

    repo.create_artist(artist)
    artists = repo.all
    last_artist = artists.last
    expect(last_artist.name).to eq 'Tom Waits'
    expect(last_artist.genre).to eq 'Rock'
  end

  it "Delete_artist method removes an artist " do
    repo = ArtistRepository.new
    id_to_delete = 1

    repo.delete_artist(id_to_delete)
    expect(repo.all.length).to eq (3)

  end

  it "delete_album method removes an album " do
    repo = ArtistRepository.new
    id_to_delete = 1
    repo.delete_album(id_to_delete)
    expect(repo.albums_all.length).to eq(11)
  end
end