# RELEASE 1 PSEUDOCODE
# DESIGN A GAME

# -GET secret word from User1 and store word in variable.
# -Create a STRING with a "_" for every letter in the secret word to keep the current state.
# -Create an empty ARRAY for keeping track of the repeated guesses.
# -Keep track of the guesses available. The total available guesses are the number of letters in the secret word.
# -WHILE available guesses are greater then zero, GET a guess from User2:
#  (Note: The User2 can try to guess the whole word at any time or just one letter in the word.)
#     Check IF input is already in the previous guesses ARRAY:
#        PRINT "Duplicated attemp!" and continue with the rest of the program.
#     ELSE
#        Deduct an available guess and continue with the rest of the program.
#     IF input's lenght is more than 1 character long:
#        Compare input against the whole word. IF whole word matches:
#           PRINT "Congratulations! You've guessed the word" and EXIT the program.
#        ELSE, PRINT "Wrong attempt!" and the current state of the word.
#     ELSE
#        See IF the letter provided is INCLUDED in the word:
#           IF true AND the secret word is not complete yet, PRINT the current state of the word.
#           ELSE if this is true AND the secret word is complete, PRINT "Congratulations! You've guessed the word" and EXIT the program.
#        ELSE, PRINT "Wrong attempt!" and the current state of the word.
#     IF
# -After all attempts are over and the word was not guessed PRINT "Sorry you couldn't guess the word! It was " and concatenate secret word.
