

class Book
 attr_accessor :id, :title, :author_name
  
 def initialize(entry)
  @id = entry.fetch("id")
  @title = entry.fetch("title")
  @author_name = entry.fetch("author_name")
 end
end 
