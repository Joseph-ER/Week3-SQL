require_relative 'lib/database_connection.rb'
require_relative 'lib/music_repository.rb'


DatabaseConnection.connect('music_library')

music_repository = MusicRepository.new
artist_arr = music_repository.all


artist_arr.each{|artist| puts "#{artist.id} - #{artist.name} - #{artist.genre}"}