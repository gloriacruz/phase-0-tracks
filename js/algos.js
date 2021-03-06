// RELEASE 0 - Pseudocode
// -Initialize a maximum length variable to zero
// -Initialize a maximum length array position variable
// -LOOP through the given array starting from position 0
//   -FOR each phrase compare the current phrase length with the maximum length variable
//   -IF the current phrase is longer, update the maximum length variable and the array position variable
//   -ELSE move to the next phrase until the whole array is analized
// -Return the phrase in the position where the longest phrase was found

// RELEASE 0 - Function
function longest_phrase(array){
  var max_length = 0;
  var position = 0;

  for(var i=0; i<array.length; i++){
    if(max_length < array[i].length){
      max_length = array[i].length;
      position = i;
    }
  }
  return array[position];
}

// RELEASE 1 - Pseudocode
// NoTe: This function will analize two objects, they can have different number of keys, in different order or with different names.
// -Take two objects to analize
// -LOOP through each pair key-value in the first object
//   -FOR each pair key-value in the first object:
//   -LOOP through each pair key-value in the second object
//     -COMPARE both pair key-value to see IF the are equal, exit function and return TRUE if they are (no need to keep comparing the rest)
//     -ELSE, move to the next pair key-value in the second object
// -Return false, if both loops ended without finding an equal pair

// RELEASE 1 - Function
function key_value_match(object1, object2){
  for(var key1 in object1) {
    for(var key2 in object2){
      if(key1 == key2){
        if(object1[key1] == object2[key2]){
          return true;
        }
      }
    }
  }
  return false;
}

// RELEASE 2 - Pseudocode
// -Take the integer as desired array length
// -Create a empty array
// -ITERATE a total of 'array length' times, one iteration for every word needed
//    -Get a random word length between 1 and 10
//    -FOR every letter needed, iterate until you reach the desired word length
//      -Generate a random alphabet character
//      -Add the new character to the word
//    -When the word is completed, add it to the array
//  -When the array is completed, return the array

// RELEASE 2 - Function
function generate_random_data(array_length){
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  array = [];
  // FOR to generate the array
  for(var i=0; i<array_length; i++){
    var word_length = get_random_num(1,10);
    var word = "";
    // FOR to generate the word
    for(var j=0; j<word_length; j++){
      word = word + alphabet[get_random_num(0,25)];
    }
    array.push(word);
  }
  return array;
}

function get_random_num(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}



// RELEASE 0 - Driver Code
console.log(longest_phrase(["long phrase","longest phrase","longer phrase"]));
console.log(longest_phrase(["elephant","tiger","chita","hippopotamus"]));
//edge cases:
console.log(longest_phrase(["only one phrase"]));
console.log(longest_phrase([""]));
console.log(longest_phrase(["same length phrases","same length phrases"]));

// RELEASE 1 - Driver Code
// true cases:
console.log(key_value_match(
  {name: "Steven", age: 54},
  {name: "Tamir", age: 54}));
console.log(key_value_match(
  {animal: "Dog", legs: 4},
  {animal: "Dog", legs: 3}));
// false cases:
console.log(key_value_match(
  {name: "Gloria", age: 32},
  {name: "Siena", age: 4}));
console.log(key_value_match(
  {animal: "Lion", color: "orange"},
  {animal: "Zebra", color: "black and white"}));
// special cases: different number of keys, in different order or with different names
console.log(key_value_match(
  {student: "Laura Doe", age: 7, grade: 2, vaccinated: true},
  {student: "John Smith", age: 7, vaccinated: false}));
console.log(key_value_match(
  {product: "Milk", price: 5.50},
  {price: 5.50, product: "Yogurt"}));
console.log(key_value_match(
  {plant: "Rose", color: "pink"},
  {insect: "Ant", average_size: "0.85mm"}));


// RELEASE 2 - Driver Code
// console.log(generate_random_data(10))
for(var i=1; i<=10; i++){
  var array = generate_random_data(i)
  console.log("Array: [" + array + "]");
  console.log("Longest word in array: " + longest_phrase(array));
}