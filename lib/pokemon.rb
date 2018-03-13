require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

def initialize (id:, name:, type:, hp: nil, db:)
  @id = id
  @name = name
  @type = type
  @hp = hp
  @db = db
  @@all << self
end

def self.save(name, type, db)
  db.execute("INSERT into pokemon (name, type) VALUES (?, ?)", name, type)
end

def self.find(id, db)

  new_pokemon = db.execute("SELECT id, name, type, hp FROM pokemon WHERE id = ?", id)
  one = self.new(id: id, name: new_pokemon[0][1], type: new_pokemon[0][2], hp: new_pokemon[0][3], db: db)
  #binding.pry
end

def alter_hp(num, db)
  #binding.pry
  db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", num, @id)
  #binding.pry
end

end
