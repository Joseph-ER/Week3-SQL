require 'pg'

class DatabaseConnection

  def self.connect(database_name)
    @connection = PG.connect({host: "127.0.0.1", dbname: database_name})
  end

  def self.exec(sql)
    @connection.exec(sql)
  end


end