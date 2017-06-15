module Shout

  def self.yell_angrily(words)
    puts words + "!!!" + " :("
  end

  def self.yelling_happily(words)
    puts words + "!" + " :D"
  end

end

# DRIVER CODE - RELEASE 1
Shout.yell_angrily("I don't like broccoli")
Shout.yelling_happily("I won the lottery")