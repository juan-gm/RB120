class GoodDog
  @@number_of_dogs = 0
  DOG_YEARS = 7

  attr_accessor :name, :height, :weight, :age
  
  def initialize(n, h, w, a)
    @name = n
    @height = h
    @weight = w
    @@number_of_dogs += 1
    self.age = a * DOG_YEARS
  end

  def speak
    "#{name} says arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

  def self.total_number_of_dogs
    @@number_of_dogs
  end
end


puts GoodDog.total_number_of_dogs

sparky = GoodDog.new("Sparky", '12 inches', '10 lbs', 4)
puts sparky.info
puts sparky.age

sparky.change_info('Spartacus', '24 inches', '45 lbs')
puts sparky.info

dog2 = GoodDog.new('dog2', '2 inches', '10 lbs', 7)
puts dog2.age
puts GoodDog.total_number_of_dogs