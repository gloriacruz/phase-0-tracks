# Pseudocode:
# Take a spy's real name
# Make real name lowercase
# Swap first name and last name
# Convert the string into an array
# For each letter in the array
#   If it's vowel
#     call method that returns next vowel
#   Otherwise
#     call method that returns next consonant
#   Add/push new vowel or new consonat to new array
# Join back the final array into a string
# Make first letter in first and last name uppercase

$vowels = "aeiou"
$consonants = 'bcdfghjklmnpqrstvwxyz'

def next_vowel(vowel)
  if vowel != 'u'
    next_vowel = $vowels[$vowels.index(vowel) + 1]
  else
    next_vowel = $vowels[0]
  end
  next_vowel
end

def next_consonant(consonat)
  if consonat != 'z'
    next_consonant = $consonants[$consonants.index(consonat) + 1]
  else
    next_consonant = $consonants[0]
  end
  next_consonant
end

def make_alias(real_name)
  letters = real_name.downcase
  letters = letters.split.reverse.join(' ')
  letters = letters.chars
  new_letters = []
  letters.each do |letter|
    if letter != ' '
      if $vowels.include? letter
        new_letters.push(next_vowel(letter))
      else
        new_letters.push(next_consonant(letter))
      end
    else
      new_letters.push(letter)
    end
  end
  fake_name = new_letters.join('')
  fake_name = fake_name.split.map { |i| i.capitalize }.join(' ')
end

loop do
  puts "Enter agent's real name (type 'quit' to finish)"
  real_name = gets.chomp
  if real_name.downcase == "quit"
    break
  else
    puts "The real name is: #{real_name}"
    puts "The alias name is: #{make_alias(real_name)}"
    puts "------------------------------"
  end
end