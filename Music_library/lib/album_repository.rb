require_relative 'album'
require_relative 'database_connection'

class AlbumRepository
  def all
    sql = "SELECT * FROM albums;"

    result_set = DatabaseConnection.exec_params(sql,[])
    albums = []

    result_set.each do |record|
      new_album = assign_to_album(record)
      albums << new_album
    end
    return albums
  end

  def assign_to_album(record)
    album = Album.new
    album.id = record['id'].to_i
    album.title = record['title']
    album.release_year = record['release_year'].to_i
    album.artist_id = record['id'].to_i
    return album
  end
end