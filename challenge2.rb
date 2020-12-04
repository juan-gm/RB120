#fill the class Human

class Human
  def initialize(name)
    @name = name
  end

  def hair_colour(color)
    "Hi, my name is #{@name} and I have #{color} hair."
  end

  def self.hair_colour(color)
    "Hi, my name is Dylan and I have #{color} hair"
  end
end
puts Human.new("Jo").hair_colour("blonde")  
#outputs "Hi, my name is Jo and I have blonde hair."
puts Human.hair_colour("blonde")              
# outputs "Hi, my name is Dylan and I have blonde hair."