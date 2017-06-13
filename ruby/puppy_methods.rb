# RELEASE 0 and 1
class Puppy

  def initialize
  	puts "Initializing a new puppy instance..."
  end

  def fetch(toy)
    puts "I brought back the #{toy}!"
    toy
  end

  def speak(i)
  	i.times { puts "Woof! "}
  end

  def roll_over
  	puts "*rolls over*"
  end

  def dog_years(human_years)
  	dog_years = human_years * 7
  	puts dog_years
  end

  def hi5
  	puts "Give paw back"
  end

end

fido = Puppy.new
fido.fetch("ball")
fido.speak(3)
fido.roll_over
fido.dog_years(3)
fido.hi5

# RELEASE 2
class Car

 	def initialize
 		puts "Initializing a new car instance..."
 	end

 	def car_manufacture(make, model)
 		puts "The car is made by #{make} and the model is #{model}"
 	end

 	def energy_efficient(type)
 		if type.downcase == 'electric' || type.downcase == "hybrid"
 			puts  "The car is energy efficient"
 		else
 			puts "The car is not energy efficient"
 		end
 	end

end

car_array = []
index = 0
until index == 50
	car_array[index] = Car.new
	index += 1
end

car_array.each do |x|
	x.car_manufacture("KIA" , "Sportage")
	x.energy_efficient("Gas")
end







