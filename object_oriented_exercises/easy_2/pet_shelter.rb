class Pet
  attr_reader :animal, :name
  
  def initialize(animal, name)
    @animal = animal
    @name = name
  end

  def to_s
   "a #{animal} named #{name}"
  end  
end

class Owner
  attr_reader :name, :pets

  def initialize(name)
    @name = name
    @pets = []
  end

  def number_of_pets
    pets.size
  end
end

class Shelter
  attr_accessor :owners_and_pets

  def initialize
    @owners_and_pets = {}
  end
  def adopt(owner, pet)
    owner.pets << pet

    if owners_and_pets[owner.name]
      owners_and_pets[owner.name] << pet
    else
      owners_and_pets[owner.name] = [pet]
    end
  end


  def print_adoptions
    owners_and_pets.each do |person, pets|
      puts "#{person} has adopted the following pets:"
      puts pets
      puts
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)


shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
