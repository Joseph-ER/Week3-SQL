require 'book_store_repository'
require 'database_connection'
require 'pg'

RSpec.describe "BookStoreRepository" do

  def reset_book_store_repository
    seed = File.read('spec/book_store_seed.sql')
    connection = PG.connect({host: "127.0.0.1", dbname: "book_store"})
    connection.exec(seed)
  end

  before :each do
    reset_book_store_repository
  end 

  it "tests sql" do
    DatabaseConnection.connect("book_store")
    book_store = BookStoreRepository.new
    # p book_store.all.first.class
    expect(book_store.all.length).to eq 5
    expect(book_store.all[0].title).to eq "Nineteen Eighty-Four"
    expect(book_store.all[1].author_name).to eq 'Virginia Woolf'

  end 


end