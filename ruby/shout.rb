# RELEASE 1
# module Shout

#   def self.yell_angrily(words)
#     puts words + "!!!" + " :("
#   end

#   def self.yelling_happily(words)
#     puts words + "!" + " :D"
#   end

# end

# # DRIVER CODE - RELEASE 1
# Shout.yell_angrily("I don't like broccoli")
# Shout.yelling_happily("I won the lottery")


# RELEASE 3
module Shout

  def yell_angrily(words)
    puts words + "!!!" + " :("
  end

  def yelling_happily(words)
    puts words + "!" + " :D"
  end

end

class Children
  include Shout
end

class Parent
  include Shout
end

some_children = Children.new
some_parent = Parent.new

some_parent.yell_angrily("Do your homework")
some_children.yell_angrily("I already did it")
some_parent.yelling_happily("Good job. You can play now")
some_children.yelling_happily("Awesome")