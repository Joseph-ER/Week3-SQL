require_relative 'lib/album_repository.rb'
require_relative 'lib/artist_repository.rb'



class Application
  def initialize(database_name, io, album_repository, artist_repository)
    DatabaseConnection.connect(database_name)
    @io = io
    @album_repository = album_repository
    @artist_repository = artist_repository
  end

  def run
    @io.puts "Welcome to the music library manager!"

    @io.puts "What would you like to do?"
    @io.puts "1 - List all albums"
    @io.puts "2 - List all artists"
    user_choice = @io.gets.to_i
    if user_choice == 1
      albums = AlbumRepository.new
      @io.puts "Here is a list of albums:"
      i = 1
      albums.all.each do |album|
        @io.puts "* #{i}- #{album.title} - #{album.release_year} - #{album.artist_id}"
        i += 1
      end
    elsif user_choice == 2
      artists = ArtistRepository.new
      @io.puts "Here is a list of artists:"
      i = 1
      artists.all.each do |artist|
        @io.puts "* #{i}- #{artist.name} - #{artist.genre}"
        i += 1
      end
    end
    end
end

if __FILE__ == $0
  app = Application.new(
    'music_library',
    Kernel,
    AlbumRepository.new,
    ArtistRepository.new
  )
  app.run
end