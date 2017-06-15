class Santa

  attr_reader :ethnicity, :reindeer_ranking
  attr_accessor :age, :gender

  def initialize(gender, ethnicity)
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0

    # puts "Initializing Santa instance: #{@gender} and #{@ethnicity}..."
  end

  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end

  # Age Santa by one year
  def celebrate_birthday
    @age += 1
  end

  # Take a reindeer's name as an argument, and move that reindeer in last place in the reindeer rankings
  def get_mad_at(reindeer)
    @reindeer_ranking.delete(reindeer)
    @reindeer_ranking.push(reindeer)
  end

  # # Setter method for @gender
  # def gender=(new_gender)
  #   @gender = new_gender
  # end

  # # Getter method for age
  # def age
  #   @age
  # end

  # # Getter method for ethnicity
  # def ethnicity
  #   @ethnicity
  # end

end


# D R I V E R  C O D E - RELEASE 0
# my_santa = Santa.new
# my_santa.speak
# my_santa.eat_milk_and_cookies("gingerbread")


# D R I V E R  C O D E - RELEASE 1
# santas = []
# genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
# ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
# # For every gender, picks a random ethnicity
# genders.each { |gender| santas << Santa.new(gender,ethnicities.sample) }


# D R I V E R  C O D E - RELEASE 2 & 3
# my_santa = Santa.new("male", "black")
# 50.times { |year| my_santa.celebrate_birthday }
# puts "Santa is #{my_santa.age} years old"
# puts "Santa is #{my_santa.ethnicity}"
# my_santa.get_mad_at("Vixen")
# my_santa.gender = "female"

def santa_generator(total)
  genders = ["agender", "female", "male", "bigender", "androgyne", "transgender", "gender fluid", "N/A"]
  ethnicities = ["black", "Latino", "Hispanic", "white", "Asian", "Indian", "Native-American", "Arab", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]

  count =1
  until count > total
      this_santa = Santa.new(genders.sample, ethnicities.sample)
      this_santa.age = rand(141) #rand(max) returns a random integer >= zero and less than max
      puts "Santa no. #{count} / Age: #{this_santa.age} / Gender: #{this_santa.gender} / Ethnicity: #{this_santa.ethnicity}"
      puts "Santa reindeer ranking: #{this_santa.reindeer_ranking}"
      count += 1
      puts "------------------------------------------------------"
  end
end

# D R I V E R  C O D E - RELEASE 4
# Creates 1000 santas
santa_generator(1000)