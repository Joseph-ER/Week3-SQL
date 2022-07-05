require_relative 'database_connection'
require_relative 'artist'
require 'pg'

class MusicRepository

  # Selecting all records
  # No arguments
  def all
    sql = 'SELECT id, name, genre FROM artists;'
    result_set = DatabaseConnection.exec_params(sql, [])
    artists = []
    result_set.each do |record|
    artist = Artist.new
    artist.id = record['id'].to_i
    artist.name = record['name']
    artist.genre = record['genre']

      artists << artist
    end
    return artists

    # Returns an array of Student objects.
  end

end