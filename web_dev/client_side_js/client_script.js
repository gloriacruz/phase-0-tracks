
console.log("Hello");
var p1 = document.getElementById("p1");
p1.style.fontWeight = "bold";
p1.style.background = "pink";


var newHeading = document.createElement('h1');
var h1Text= document.createTextNode("This is a new header text!");
newHeading.appendChild(h1Text);
var firstHeading = document.getElementById('header1');
firstHeading.appendChild(newHeading);
var parent = firstHeading.parentNode;
parent.insertBefore(newHeading, firstHeading);
