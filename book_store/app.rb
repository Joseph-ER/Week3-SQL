require_relative 'lib/database_connection'
require_relative 'lib/book_store_repository'

DatabaseConnection.connect('book_store')

book_store_repository = BookStoreRepository.new
book_array = book_store_repository.all

book_array.each{|book| puts "#{book.id} - #{book.title} - #{book.author_name}"}