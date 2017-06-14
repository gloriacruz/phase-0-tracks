class Santa

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0

    puts "Initializing Santa instance: #{@gender} and #{ethnicity}..."
  end

end

# D R I V E R  C O D E - RELEASE 0
# my_santa = Santa.new
# my_santa.speak
# my_santa.eat_milk_and_cookies("gingerbread")

# D R I V E R  C O D E - RELEASE 1
santas = []
genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# For every gender, picks a random ethnicity
genders.each { |gender| santas << Santa.new(gender,ethnicities.sample) }