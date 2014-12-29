module Towable
  def towing_capacity
    "4500 lbs"
  end
end

class Vehicle
  @@number_of_vehicles = 0
  attr_accessor :year, :color, :model, :speed


  def initialize
    self.speed = 0
    puts "What year is the car? (XXXX)"
    self.year = gets.chomp.to_i
    puts "What's the color of the car?"
    self.color = gets.chomp.capitalize
    puts "What's the model of the car?"
    self.model = gets.chomp.capitalize

    @@number_of_vehicles += 1
  end

  def self.total_number_of_vehicles
    @@number_of_vehicles
  end

  def self.calculate_gas_mileage
    "Your car mileage is 45 mpg"
  end

  def spray_paint
    puts "What color do you want to spray paint your #{year} #{model},
    you currently have the color #{color}"
    self.color = gets.chomp.capitalize
    puts "Your car is now #{color}"
  end

  def puts_current_info
    puts "Your #{year} #{color} #{model} is going #{speed} mph."
  end

  def speed_up
    puts "Car is speeding up"
    self.speed += 25
  end

  def brake
    if speed > 0
      puts "Car is slowing down"
      self.speed -= 25
    end
  end

  def shut_car_off
    puts "Coming to complete stop and turning engine off"
    while speed > 0
      self.brake
    end
    self.puts_current_info
  end
end

class MyTruck < Vehicle
  include Towable
  MPG = 12
end

class MyCar < Vehicle
  MPG = 45

end


tom_car = MyCar.new
tom_truck = MyTruck.new

tom_car.speed_up
tom_car.speed_up
tom_car.speed_up
tom_car.puts_current_info
tom_car.shut_car_off
tom_truck.puts_current_info
puts Vehicle.total_number_of_vehicles
puts tom_truck.towing_capacity



