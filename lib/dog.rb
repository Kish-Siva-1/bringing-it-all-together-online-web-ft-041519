class Dog
  
  attr_accessor :id, :name, :breed
  
  def initialize(id: nil, name:, breed: )
    @id = id 
    @name = name 
    @breed = breed 
  end
  
  def self.create_table 
    sql =  <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
        )
        SQL
    DB[:conn].execute(sql)
  end 
  
  def self.drop_table
    sql =  <<-SQL
      DROP TABLE IF EXISTS dogs
        SQL
    DB[:conn].execute(sql)
  end 
  
  def save
    if !@id 
      sql = <<-SQL
        INSERT INTO dogs (name, breed)
        VALUES (?, ?)
      SQL
      dog = DB[:conn].execute(sql, self.name, self.breed) 
      @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]
      dog
    else 
      sql = <<-SQL
        UPDATE dogs SET  WHERE id = ? 
        VALUES (?, ?)
      SQL
      dog = DB[:conn].execute(sql, self.name, self.breed)
      dog
    end 
      binding.pry
  end 
  
  def self.create
    
  end 
  
  def self.find_by_id 
    
  end 
  
  def self.find_or_create_by
  
  end 
  
  def self.new_from_db
    
  end 
  
  def self.find_by_name
    
  end 
  
  def update
    
  end 
  
end 