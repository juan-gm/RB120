class Cat
  attr_reader :name, :color
  
  COLOR = 'purple'
  
  def initialize(name)
    @name = name
    @color = COLOR
  end

  def greet
    puts "Hello! My name is #{name} and I'm a #{color} cat"
  end
end




kitty = Cat.new('Sophie')
kitty.greet