class Transform
  attr_reader :name
  def initialize(name)
    @name = name
  end

  def self.lowercase(string)
    string.downcase
  end

  def uppercase
    name.upcase
  end
end

my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')