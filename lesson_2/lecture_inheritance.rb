class Animal
  def run
    'running!'
  end

  def jump
    'jumping!'
  end
end

class Cat < Animal
  def speak
    'miau!'
  end
end

class Dog < Animal
  def speak
    'bark!'
  end

  def swim
    'swimming!'
  end

  def fetch
    'fetching!'
  end
end

class Bulldog < Dog
  def swim
    "can't swim!"
  end
end



teddy = Dog.new
puts teddy.speak           # => "bark!"
puts teddy.swim           # => "swimming!"

dog = Bulldog.new
puts dog.speak
puts dog.swim

