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
  end

  def find(id)
    sql = 'SELECT * FROM artists WHERE id = $1;'
    param = [id]
    result_set = DatabaseConnection.exec_params(sql, param)
    result = result_set[0]
    artist = Artist.new
    artist.id = result['id'].to_i
    artist.name = result['name']
    artist.genre = result['genre']

    return p artist
  end

end