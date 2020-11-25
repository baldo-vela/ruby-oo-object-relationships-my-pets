class Dog
  attr_accessor  :owner, :mood
  attr_reader :name, :species

  @@all= []

  def initialize(name, owner)
    @name = name
    @species = "dog"
    @owner = owner
    @mood = "nervous"
    save
  end
  
  def save
    @@all <<self
  end

  def self.all
    return @@all
  end
end