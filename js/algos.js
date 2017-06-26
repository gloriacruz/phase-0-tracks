// RELEASE 0 - Pseudocode
// -Initialize a maximum length variable to zero
// -Initialize a maximum length array position variable
// -LOOP through the given array starting from position 0
//   -FOR each phrase compare the current phrase length with the maximum length variable
//   -IF the current phrase is longer, update the maximum length variable and the array position variable
//   -ELSE move to the next phrase until the whole array is analized
// -Return the phrase in the position where the longest phrase was found

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
