# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative in this case the location is relative to the file
# require will need the full file path
require_relative 'state_data'

class VirusPredictor

  # this method is in charge of initializing the instance variables
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # this method call the other two private methods in the class
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # this method calculates the number of deaths based on a population density limits using different formulas
  def predicted_deaths
    # predicted deaths is solely based on population density
    if @population_density >= 200
      death_var = 0.4
    elsif @population_density >= 150
      death_var = 0.3
    elsif @population_density >= 100
      death_var = 0.2
    elsif @population_density >= 50
      death_var = 0.1
    else
      death_var = 0.05
    end

    number_of_deaths = (@population * death_var).floor
    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

  # this method calculates the speed of spread based on a population density limits usgin different values for each
  def speed_of_spread #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.

    if @population_density >= 200
      speed = 0.5
    elsif @population_density >= 150
      speed = 1
    elsif @population_density >= 100
      speed = 1.5
    elsif @population_density >= 50
      speed = 2
    else
      speed = 2.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state


# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects

STATE_DATA.each do |state_name, sub_hash|
  state = VirusPredictor.new(state_name, sub_hash[:population_density], sub_hash[:population])
  state.virus_effects
end

#=======================================================================
# Reflection Section

# What are the differences between the two different hash syntaxes shown in the state_data file?
# In the state_data file, there are two types of hashes. The outer hash uses rocket notation, because the keys are intended to be printed on screen. So the keys are strings and the values are hashes. The sub hashes use symbols for the keys because they are just used to repeatedly access the values attached to them.

# What does require_relative do? How is it different from require?
# Require relative tells the file where to look for the other file with respect to where the calling file is. Require, on the other hand, needs the full path of the file.

# What are some ways to iterate through a hash?
# We can use .each like in our example. We can also use .map.

# When refactoring virus_effects, what stood out to you about the variables, if anything?
# That initially, we were passing the instance variables (attributes) to the other two methods when it's not necessary, because the variables are already accesible within the class.

# What concept did you most solidify in this challenge?
# The class concept in general was solidified and I learn something new about the private methods.