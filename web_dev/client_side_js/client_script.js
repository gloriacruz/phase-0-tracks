// RELEASE 1
// Change the style of a element with javascript
var p1 = document.getElementById("p1");
p1.style.fontWeight = "bold";
p1.style.background = "pink";

// RELEASE 1
// Adding a new HTML element to the page
var newHeading = document.createElement('h1');
var h1Text= document.createTextNode("This is a new header text!");
newHeading.appendChild(h1Text);
var firstHeading = document.getElementById('header1');
var parent = firstHeading.parentNode;
parent.insertBefore(newHeading, firstHeading);

// RELEASE 2
// Adding a click event listener
firstHeading.addEventListener("click",clickTitle);

function clickTitle(event){
  event.target.style.background = "green";
}

