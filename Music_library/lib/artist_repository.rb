require_relative 'database_connection'
require_relative 'artist'
require 'pg'
require_relative 'album'

class ArtistRepository

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

  def create_artist(artist)
    sql = 'INSERT INTO artists (name, genre) VALUES ($1, $2);'
    sql_params = [artist.name, artist.genre]

    DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end

  def create(album)
    sql = "INSERT INTO albums (title, release_year, artist_id) VALUES ($1, $2, $3);"
    sql_params = [album.title, album.release_year, album.artist_id]

    DatabaseConnection.exec_params(sql, sql_params)
    return nil
  end

  def albums_all
    sql = 'SELECT id, title, release_year, artist_id FROM albums;'
    result_set = DatabaseConnection.exec_params(sql, [])
    albums = []
    result_set.each do |record|
      album = Album.new
      album.id = record['id']
      album.title = record['title']
      album.release_year = record['release_year']
      album.artist_id = record['artist_id']

      albums << album
    end
    return albums
  end

  def delete_artist(id)
    sql = 'DELETE FROM artists WHERE id = $1;'
    param = [id]

    DatabaseConnection.exec_params(sql, param)
    return nil
  end

  def delete_album(id)
    sql = 'DELETE FROM albums WHERE id = $1;'
    param = [id]

    DatabaseConnection.exec_params(sql, param)
    return nil
  end

    def find_with_albums(id)
      sql = 'SELECT artists.id,
                    artists.name,
                    artists.genre,
                    albums.id AS album_id,
                    albums.title,
                    albums.release_year
            FROM artists
            JOIN albums ON albums.artist_id = artists.id
            WHERE artists.id = $1;'
  
      params = [id]
  
      result = DatabaseConnection.exec_params(sql, params)
  
      artist = Artist.new
  
      artist.id = result.first['id']
      artist.name = result.first['name']
      artist.genre = result.first['genre']
  
      result.each do |record|
        album = Album.new
        album.id = record['album_id']
        album.title = record['title']
        album.release_year = record['release_year']
  
        artist.albums << album
    end
  end
end