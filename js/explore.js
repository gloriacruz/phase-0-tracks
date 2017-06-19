// RELEASE 4
// Pseudocode a function that takes a string as a parameter and reverses the string. reverse("hello"), for example, should return "olleh".

// Take the string to be reversed
// GET the length of the original string and SAVE it
// Starting from the END of the string, take EACH letter and PUSH it into a new word. Continue moving towards the beginning of the word and stop UNTIL you reach the first word on the original string.
// RETURN the new word

function reverse(string) {
  var strLength = string.length;
  var reversedString = "";
  for(var i=strLength-1; i>=0; i--){
    reversedString += string[i];
  }
  return reversedString;
}

var originalString = "Hello"
console.log("Original string: " + originalString + " Reversed string: " + reverse(originalString))