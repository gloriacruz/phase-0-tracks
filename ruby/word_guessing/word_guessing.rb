# RELEASE 1 PSEUDOCODE
# DESIGN A GAME

# -GET secret word from User1 and store word in variable.
# -Create a STRING with a "_" for every letter in the secret word to keep the current state.
# -Create an empty ARRAY for keeping track of the repeated guesses.
# -Keep track of the guesses available. The total available guesses are the number of letters in the secret word.
# -WHILE available guesses are greater then zero, GET a guess from User2:
# (NoTe: The User2 can try to guess the whole word at any time or just one letter in the word.)
#   -Check IF input is already in the previous guesses ARRAY:
#     -PRINT "Duplicated attemp!" and continue with the rest of the program.
#    ELSE
#     -Deduct an available guess and continue with the rest of the program.
#     -PUSH word or letter to the previous guesses ARRAY.
#   -IF input's lenght is more than 1 character long:
#     -Compare input against the whole word. IF whole word matches:
#       -PRINT "Congratulations! You've guessed the word" and EXIT the program.
#     -ELSE, PRINT the current state of the word.
#   -ELSE
#     -See IF the letter provided is INCLUDED in the word:
#       -IF true AND the secret word is not complete yet, UPDATE and PRINT the current state of the word.
#       -ELSE if this is true AND the secret word is complete, PRINT "Congratulations! You've guessed the word" and EXIT the program.
#     -ELSE, PRINT the current state of the word.
# -After all attempts are over and the word was not guessed PRINT "Sorry you couldn't guess the word! It was " and concatenate secret word.

class Word_Guessing
  attr_accessor :prev_guesses, :current_state, :available_guesses
  attr_reader :secret_word, :is_over_won

  def initialize(secret_word)
    puts "Initializing game for new secret word..."
    @secret_word = secret_word
    @current_state = ""
    secret_word.length.times { @current_state << "_" }
    @prev_guesses = []
    @available_guesses = secret_word.length
    @is_over_won = false
  end

  def deduct_available_guesses
    @available_guesses -= 1
  end

  def is_repeated_guess(guess)
    @prev_guesses.include? guess
  end

  def is_word_complete()
    !@current_state.include? "_"
  end

  def update_current_state(guess)
    start = 0
    while @secret_word.index(guess, start) != nil
      @current_state[@secret_word.index(guess,start)] = guess
      start = @secret_word.index(guess,start) + 1
    end
    @current_state
  end

  def add_to_previous_guesses(guess)
    prev_guesses << guess
  end

  def try_guess(guess)
    if !is_repeated_guess(guess)
      deduct_available_guesses
      add_to_previous_guesses(guess)
    end

    if guess.length > 1
      if @secret_word == guess
          @is_over_won = true
      else
        false
      end
    elsif guess.length > 0
      if @secret_word.include? guess
        update_current_state(guess)
        if !is_word_complete()
          true
        else
          @is_over_won = true
        end
      else
        false
      end
    else
      false
    end
  end

end

# DRIVER CODE
# User Interface: driver code will handle input and output as far as the user is concerned

# puts "Welcome to the word guessing game!"
# puts "User1: What's the secret word?"
# user1_input = gets.chomp
# game = Word_Guessing.new(user1_input)
# while game.available_guesses > 0 && !game.is_over_won
#   puts "--------------------------------------------------"
#   puts "#{game.available_guesses} attempts left"
#   puts "Secret word (current state): #{game.current_state}"
#   puts "User2: Can you guess the secret word? Type the word or guess a letter in the word"
#   user2_input = gets.chomp
#   if game.is_repeated_guess(user2_input)
#     puts "Duplicated attempt!"
#   end

#   if game.try_guess(user2_input) && game.is_over_won
#     puts "Congratulations! You've guessed the word: #{game.secret_word}"
#   else
#     puts "Secret word (current state): #{game.current_state}"
#   end
# end

# if !game.is_word_complete() && !game.is_over_won
#   puts "Sorry you couldn't guess the word! The secret word was: #{game.secret_word}"
# end



