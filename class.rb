class GoodDog
  attr_accessor :name, :height, :weight

  def initialize(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def speak
    "#{name} says: Arf!"
  end

  def change_info(n, h, w)
    self.name = n
    self.height = h
    self.weight = w
  end

  def info
    "#{name} weighs #{weight} and is #{height} tall."
  end

end

sparky = GoodDog.new('Sparky', '12 inches', '10 lbs')
fido = GoodDog.new('Fido', '2 feet', '20 lbs')

puts sparky.info

sparky.change_info('tom', 'twenty feet', '10lbs')

puts sparky.info
puts fido.info


