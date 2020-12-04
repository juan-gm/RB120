#The callenge consists of writing the Ancestors' class
#body so line 29 outputs what it's supposed to do.


class Ancestors
  def bob
    Persons.new
  end

  def self.hello
    "ancestors class"
  end
end

class Humans < Ancestors
  def hello
    "ancestors class"
  end
end

class Persons < Humans
  def who_am_i
    puts "I am the #{bob.class.hello}" 
  end
 
end

bob = Persons.new
bob.who_am_i # I am the ancestors class