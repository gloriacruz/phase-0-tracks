class Puppy

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


