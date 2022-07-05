require 'pg'

class DatabaseConnection

  def self.connect(database_name)
    @connect = PG.connect({ host:'127.0.0.1', dbname: database_name })
  end

  def self.exec_params(query, params)
    @connect.exec_params(query, params)
  end

end