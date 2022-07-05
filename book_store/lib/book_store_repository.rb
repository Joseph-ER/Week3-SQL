require 'pg'
require_relative 'database_connection'
require_relative 'book'
class BookStoreRepository

  def all
    book_array = []
    DatabaseConnection.exec("SELECT * FROM books;").each{|entry| book_array << Book.new(entry)}
    return book_array
    # returns an array of all the books
  end 



end 
