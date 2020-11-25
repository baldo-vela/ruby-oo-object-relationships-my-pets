class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
      @name = name
      @species = "human"
      save
  end

  def save
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    #Class methods .all returns all instances of Owner that have been created
    return @@all
  end

  def self.count
    #Class methods .count returns the number of owners that have been created
    return @@all.length
  end

  def self.reset_all
    #Class methods .reset_all can reset the owners that have been created
    @@all.clear
  end

  def sell_pets
    self.sell_cats
    self.sell_dogs
  end

  def list_pets
    return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end


  #Cat Methods
  def cats
    scratch_array = []
    Cat.all.each { |a_cat| scratch_array.push(a_cat) if a_cat.owner == self}
    return scratch_array
  end

  def buy_cat(cat_name)
  #buy_cat can buy a cat that is an instance of the Cat class for this owner
    Cat.new(cat_name, self)
  end
  
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_cats
    self.cats.each do |cat| 
      cat.mood = "nervous" 
      cat.owner = nil
    end
  end

  #Dog Methods
  def dogs
    scratch_array = []
    Dog.all.each { |a_dog| scratch_array.push(a_dog) if a_dog.owner == self}
    return scratch_array
  end

  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end

  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy"}
  end

  def sell_dogs
    self.dogs.each do |dog| 
      dog.mood = "nervous" 
      dog.owner = nil
    end
  end

end